# frozen_string_literal: true

## Uncomment to enable email excpetion notifications after enabling in gemfile
## https://github.com/smartinez87/exception_notification

# unless Rails.env == 'test' || Rails.env == 'development'
#   host = ENV.fetch('APP_HOST') { 'localhost' }
#   Rails.application.config.middleware.use ExceptionNotification::Rack,
#       email: {
#             email_prefix:         "[#{host} ERROR] ",
#             sender_address:       %{"Exception Notifier" <support@example.com>},
#             exception_recipients: ["support@example.com"],
#             sections:             ["request", "backtrace", "session"],
#             verbose_subject:      true
#       }
# end
