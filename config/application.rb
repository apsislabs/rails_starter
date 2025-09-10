# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Connection pool and concurrency configuration
    config.x.default_web_concurrency = Rails.env.production? ? ((Concurrent.processor_count * 2) + 1) : 0
    config.x.web_concurrency =
      (ENV.fetch("APP_CONCURRENCY", config.x.default_web_concurrency).presence || config.x.default_web_concurrency).to_i
    config.x.max_threads = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
    config.x.min_threads = ENV.fetch("RAILS_MIN_THREADS", config.x.max_threads)

    # pool should always be >= (Puma) * RAILS_MAX_THREADS)
    config.x.db_connection_pool = config.x.max_threads * [config.x.web_concurrency, 1].max
  end
end
