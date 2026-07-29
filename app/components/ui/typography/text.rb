# frozen_string_literal: true

module UI
  class Text < ApplicationComponent
    STYLES = {
      body: nil,
      muted: "text-muted-foreground",
      small: "text-sm text-muted-foreground",
      lead: "text-lg text-muted-foreground"
    }.freeze

    option :variant, ->(variant) {
      raise ArgumentError, "unknown variant #{variant}" unless STYLES.key?(variant)

      variant
    }, default: proc { :body }
    option :tag, default: proc { :p }

    def view_template
      render_tag(@tag, **attrs(class: STYLES.fetch(@variant))) { yield }
    end
  end
end
