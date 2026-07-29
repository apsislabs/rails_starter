# frozen_string_literal: true

module UI
  class Tooltip < ApplicationComponent
    option :text

    def view_template
      span(**attrs(class: "relative inline-flex", data: {controller: "tooltip"})) do
        yield
        span(
          class: "pointer-events-none absolute bottom-full left-1/2 z-10 mb-2 hidden -translate-x-1/2 whitespace-nowrap rounded-control bg-foreground px-2 py-1 text-xs text-background",
          role: :tooltip,
          data: {tooltip_target: "content"}
        ) { @text }
      end
    end
  end
end
