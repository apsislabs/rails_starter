# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.use Rack::Attack
    config.middleware.insert_after ActionDispatch::Static, Rack::Deflater

    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = ENV.fetch('JOB_QUEUE_NAME') { "active_job_#{Rails.env}" }
  end
end
