# frozen_string_literal: true

module UI
  class Dropdown < ApplicationComponent
    def trigger(&block)
      @trigger = block
    end

    def menu(&block)
      @menu = block
    end

    def view_template
      yield self if block_given?

      div(**attrs(class: "relative inline-block", data: {controller: "dropdown"})) do
        button(type: :button, "aria-haspopup": :menu, data: {action: "dropdown#toggle"}) { @trigger&.call }
        div(
          class: "absolute right-0 z-10 mt-2 hidden min-w-48 rounded-container border border-border bg-surface p-1 shadow-lg",
          role: :menu,
          data: {dropdown_target: "menu", action: "click@window->dropdown#hide"}
        ) { @menu&.call }
      end
    end
  end
end
