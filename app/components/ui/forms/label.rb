# frozen_string_literal: true

module UI
  class Label < ApplicationComponent
    option :for_id, default: proc {}
    option :required, default: proc { false }

    def view_template
      label(**attrs(for: @for_id)) {
        yield
        span(class: "ml-1 text-danger", "aria-hidden": true) { "*" } if @required
      }
    end
  end
end
