# frozen_string_literal: true

module UI
  class Badge < ApplicationComponent
    STYLES = {
      neutral: "bg-surface-muted text-muted-foreground",
      success: "bg-success-subtle text-success",
      warning: "bg-warning-subtle text-warning-foreground",
      danger: "bg-danger-subtle text-danger",
      info: "bg-info-subtle text-info"
    }.freeze

    option :variant, ->(variant) {
      raise ArgumentError, "unknown variant #{variant}" unless STYLES.key?(variant)

      variant
    }, default: proc { :neutral }

    def view_template
      span(**attrs(class: cn("inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium", STYLES.fetch(@variant)))) { yield }
    end
  end
end
