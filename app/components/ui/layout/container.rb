# frozen_string_literal: true

module UI
  class Container < ApplicationComponent
    SIZES = %i[default narrow fluid].freeze

    option :size, ->(size) {
      raise ArgumentError, "unknown size #{size} (expected one of #{SIZES.join(", ")})" unless SIZES.include?(size)

      size
    }, default: proc { :default }

    def view_template
      div(**attrs(data: {container: (@size == :default) ? true : @size})) { yield }
    end
  end
end
