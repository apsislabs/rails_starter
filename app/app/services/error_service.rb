# frozen_string_literal: true

class ErrorService
  def self.capture(e)
    # Sentry.capture_exception(e)

    caller_location = caller_locations(1..1).first
    caller_label = "#{caller_location.path}:#{caller_location.lineno}"

    message =
      ([
        "-------------------------------------------",
        "Captured error #{e.class}: \"#{e.message}\"",
        " ↳ #{caller_label}",
        "-------------------------------------------"
      ] + e.backtrace + ["-------------------------------------------"]).join("\n")

    # uncomment this if you're running rspec and want to debug the error in a spec
    # leave this commented out when you're done, because many specs will intentionally
    # produce errors, and we don't care.
    # Rails.logger.debug(message) if Rails.env.test?
    Rails.logger.error(message)
  end
end
