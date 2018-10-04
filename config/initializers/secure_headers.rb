# frozen_string_literal: true

if Rails.env.development?
  SecureHeaders::Configuration.default do |config|
    config.cookies = {
      secure: true, # mark all cookies as "Secure"
      httponly: true, # mark all cookies as "HttpOnly"
      samesite: {
        lax: true # mark all cookies as SameSite=lax
      }
    }

    config.hsts = "max-age=#{1.week.to_i}"
    config.x_frame_options = 'SAMEORIGIN'
    config.x_content_type_options = 'nosniff'
    config.x_xss_protection = '1; mode=block'
    config.x_download_options = 'noopen'
    config.x_permitted_cross_domain_policies = 'none'
    config.referrer_policy = %w(origin-when-cross-origin strict-origin-when-cross-origin)

    config.csp = config.csp.merge(
      # directive values: these values will directly translate into source directives
      default_src: %w('none'),
      connect_src: %w('self'),
      script_src: %w('self' 'unsafe-inline' 'unsafe-eval' http: https:),
      font_src: %w(http: https:),
      style_src: %w('self' 'unsafe-inline' http: https:),
    )
  end
else
  SecureHeaders::Configuration.default
end
