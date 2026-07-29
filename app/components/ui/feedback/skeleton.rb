# frozen_string_literal: true

module UI
  class Skeleton < ApplicationComponent
    option :lines, default: proc { 1 }

    def view_template
      div(**attrs(class: "space-y-2", "aria-busy": true)) { @lines.times { div(class: "h-4 animate-pulse rounded-control bg-surface-muted") } }
    end
  end
end
