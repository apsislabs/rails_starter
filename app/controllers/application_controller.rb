# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ParamsHelper

  before_action { @pagy_locale = locale_param }

  layout :set_layout

  add_flash_types :info, :error, :warning, :success
  allow_browser versions: :modern
  protect_from_forgery with: :exception

  around_action :apply_locale
  around_action :apply_time_zone

  private

  def apply_time_zone(&)
    old_zone = Groupdate.time_zone
    Groupdate.time_zone = current_user&.time_zone
    Time.use_zone(current_user&.time_zone, &)
  ensure
    Groupdate.time_zone = old_zone
  end

  def apply_locale(&)
    I18n.with_locale(locale_param, &)
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if defined?(current_user) && current_user
  end

  def set_layout
    return "auth" if devise_controller?

    "application"
  end
end
