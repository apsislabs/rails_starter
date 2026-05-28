# frozen_string_literal: true

require "data_uri"

module ParamsHelper
  extend ActiveSupport::Concern

  included do
    def bool_param(key, default: false)
      params[key].present? ? ActiveModel::Type::Boolean.new.cast(params[key]) : default
    end

    def int_param(key, default: nil)
      params[key].present? ? ActiveModel::Type::Integer.new.cast(params[key]) : default
    end

    def date_param(key, default: nil)
      Timeliness.parse(params[key], :date).presence || default
    end

    def datetime_param(key, default: nil)
      Timeliness.parse(params[key], :datetime).presence || default
    end

    def time_param(key, default: nil)
      Timeliness.parse(params[key], :time).presence || default
    end

    def page_param
      params[:page].presence || 1
    end

    def per_param
      params[:per].presence || 10
    end

    def sort_param
      params[:sort]
    end

    def sort_dir_param
      case params[:dir]&.to_s&.downcase
      when "asc" then :asc
      when "desc" then :desc
      end
    end

    def search_param
      params[:q].presence || params[:search].presence
    end

    def for_param
      params[:for].presence
    end

    def file_from_data_uri(base64)
      uri = DataUri.new(base64)
      tempfile = FileService.instance.tempfile_from_base64(base64)
      filename = uri.mime_params["name"] || File.basename(tempfile)
      uploaded_file = ActionDispatch::Http::UploadedFile.new(tempfile:, filename:, type: uri.content_type)

      # Return the file object
      uploaded_file.rewind
      uploaded_file
    end

    def locale_param
      @locale_param ||= params[:locale] || I18n.default_locale
    end

    def disposition_param
      params[:disposition].presence || :inline
    end
  end
end
