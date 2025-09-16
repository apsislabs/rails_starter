# frozen_string_literal: true

module ApiControllerHelpers
  extend ActiveSupport::Concern

  included do
    include JsonErrors

    rescue_from StandardError, with: :rescue_500
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_422
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::ParameterMissing, with: :rescue_400
    rescue_from PapersPlease::AccessDenied, with: :rescue_403
    prepend_before_action :set_default_response_format

    protected

    def set_default_response_format
      request.format = :json if request.format.blank?
    end

    def rescue_500(err)
      raise err unless Rails.env.production?

      ErrorService.capture(err)

      render_500("Uh oh... something went wrong!")
    end

    def rescue_422(err)
      render_422(err.message)
    end

    def rescue_404(err)
      render_404(err.message)
    end

    def rescue_403(err)
      render_403(err.message)
    end

    def rescue_400(err)
      render_400(err.message)
    end
  end
end
