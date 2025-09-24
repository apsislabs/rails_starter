# frozen_string_literal: true

require "uri"
require "base64"
require "stringio"
require "cgi"

# DataUri is based on the data_uri gem.
# Extracted here for Ruby 3 compatibility with the URI library.
# Source: https://github.com/dball/data_uri
class DataUri
  COMPONENT = %i[scheme opaque].freeze
  MIME_TYPE_RE = %r{\A([-\w.+]+/[-\w.+]*)}
  MIME_PARAM_RE = /\A;([-\w.+]+)=([^;,]+)/

  attr_reader :content_type, :data, :mime_params

  def initialize(uri)
    uri = uri.to_s
    raise URI::InvalidURIError, "Invalid Data URI: #{uri.inspect}" unless uri.start_with?("data:")

    @scheme = "data"
    @opaque = uri[5..]
    parse_data
  end

  def self.build(arg)
    data, content_type = case arg
    when IO
      [arg, nil]
    when Hash
      [arg[:data], arg[:content_type]]
    else
      raise "Invalid build argument: #{arg.inspect}"
    end

    raise "Missing data for DataUri.build" unless data

    content_type ||= data.respond_to?(:content_type) ? data.content_type : "text/plain"

    encoded = Base64.encode64(data.read).delete_suffix("\n")
    new("data:#{content_type};base64,#{encoded}")
  end

  private

  def parse_data
    @data = @opaque
    extract_content_type
    extract_mime_params
    decode_data
    enforce_charset
  end

  def extract_content_type
    if (md = MIME_TYPE_RE.match(@data))
      @content_type = md[1]
      @data = @data[@content_type.length..]
    else
      @content_type = "text/plain"
    end
  end

  def extract_mime_params
    @mime_params = {}
    while (md = MIME_PARAM_RE.match(@data))
      @mime_params[md[1]] = md[2]
      @data = @data[md[0].length..]
    end
  end

  def decode_data
    base64 = @data.start_with?(";base64")
    @data = base64 ? @data[7..] : @data
    raise URI::InvalidURIError, "Invalid data URI" unless @data.start_with?(",")

    @data = @data[1..]
    @data = base64 ? Base64.decode64(@data) : CGI.unescape(@data)
  end

  def enforce_charset
    return unless @data.respond_to?(:force_encoding)

    if (charset = @mime_params["charset"])
      @data.force_encoding(charset)
    end
  end
end
