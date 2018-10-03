# frozen_string_literal: true

if Rails.env.development?
  SecureHeaders::Configuration.default do |config|
    config.csp = config.csp.merge(
      script_src: ["'self'", "'unsafe-eval'"],
      style_src: ["'self'", "'unsafe-inline'"]
    )

    config.csp_report_only = config.csp.merge(
      report_uri: ['https://apsis.io/']
    )
  end
else
  SecureHeaders::Configuration.default
end
