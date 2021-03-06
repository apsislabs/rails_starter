# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.use Rack::Attack if Rails.env.production?
    config.middleware.use Rack::Deflater
    config.middleware.delete Rack::Runtime if Rails.env.production?

    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = ENV.fetch('JOB_QUEUE_NAME') { "active_job_#{Rails.env}" }

    config.display_env = ENV['DISPLAY_ENV'] || Rails.env

    # SWITCH MYSQL: consider deleting this if your mysql version doesn't support uuids
    # as a native type
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
