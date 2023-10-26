# frozen_string_literal: true

require "sidekiq/api"

redis_config = { url: ENV.fetch("REDIS_SIDEKIQ_URL", nil) }

Sidekiq.configure_server { |config| config.redis = redis_config }

Sidekiq.configure_client { |config| config.redis = redis_config }

require "sidekiq/web"
Sidekiq::Web.app_url = "/"
