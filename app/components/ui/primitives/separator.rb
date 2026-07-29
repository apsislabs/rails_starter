# frozen_string_literal: true

module UI
  class Separator < ApplicationComponent
    option :orientation, default: proc { :horizontal }

    def view_template
      separator_class = (@orientation == :vertical) ? "m-0 h-full w-px border-0 bg-border" : "m-0 h-px w-full border-0 bg-border"
      hr(**attrs(class: separator_class, "aria-orientation": @orientation))
    end
  end
end
