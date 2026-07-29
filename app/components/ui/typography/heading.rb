# frozen_string_literal: true

module UI
  class Heading < ApplicationComponent
    LEVELS = (1..6)

    option :level, ->(level) {
      int_level = Integer(level, exception: false)
      raise ArgumentError, "unknown level #{level.inspect} (expected one of #{LEVELS.to_a.join(", ")})" unless int_level && LEVELS.cover?(int_level)

      int_level
    }, default: proc { 2 }

    def view_template
      render_tag("h#{@level}", **attrs) { yield }
    end
  end
end
