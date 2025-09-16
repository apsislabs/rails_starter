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
      JsonDateParser.parse_date(params[key]).presence || default
    end

    def datetime_param(key, default: nil)
      JsonDateParser.parse_datetime(params[key]).presence || default
    end

    def page_param
      params[Pagy::DEFAULT[:page_param]].presence || 1
    end

    def per_param
      params[Pagy::DEFAULT[:limit_param]].presence || Pagy::DEFAULT[:limit]
    end

    def search_param
      params[:q].presence || params[:search].presence
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

    def disposition
      params[:disposition]
    end
  end
end
