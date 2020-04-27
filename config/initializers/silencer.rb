# frozen_string_literal: true

require 'silencer/logger'

Rails.application.configure do
  config.middleware.swap(
    Rails::Rack::Logger,
    Silencer::Logger,
    config.log_tags,
    silence: ['/status', '/favicon.ico']
  )
end
