# frozen_string_literal: true

module JsonErrors
  extend ActiveSupport::Concern

  class << self
    def format_errors(errors:, status:, meta: nil)
      {success: false, status:, errors: Array.wrap(errors), meta:}
    end
  end

  included do
    def render_400(errors = "bad_request", meta = nil)
      render_errors(errors, 400, meta)
    end

    def render_401(errors = "unauthorized access", meta = nil)
      render_errors(errors, 401, meta)
    end

    def render_403(errors = "forbidden", meta = nil)
      render_errors(errors, 403, meta)
    end

    def render_404(errors = "not found", meta = nil)
      render_errors(errors, 404, meta)
    end

    def render_409(errors = "conflict", meta = nil)
      render_errors(errors, 409, meta)
    end

    def render_422(errors = "could not save data", meta = nil)
      render_errors(errors, 422, meta)
    end

    def render_500(errors = "internal server error", meta = nil)
      render_errors(errors, 500, meta)
    end

    def render_errors(errors, status = 400, meta = nil)
      data = JsonErrors.format_errors(errors:, status:, meta:)
      render json: data, status:
    end
  end
end
