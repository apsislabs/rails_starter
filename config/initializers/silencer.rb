# frozen_string_literal: true

Rails.application.configure do
  config.middleware.swap(
    Rails::Rack::Logger,
    Silencer::Logger,
    config.log_tags,
    silence: %w[/status /up /favicon.ico]
  )
end