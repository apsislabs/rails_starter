if Rails.env.development?
  SecureHeaders::Configuration.default do |config|
    config.csp = config.csp.merge(
      script_src: %w('self' 'unsafe-eval'),
      style_src: %w('self' 'unsafe-inline')
    )

    config.csp_report_only = config.csp.merge(
      report_uri: %w(https://apsis.io/)
    )
  end
else
  SecureHeaders::Configuration.default
end
