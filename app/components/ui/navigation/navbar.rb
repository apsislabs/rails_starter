# frozen_string_literal: true

module UI
  class Navbar < ApplicationComponent
    def brand(&block)
      @brand = block
    end

    def navigation(&block)
      @navigation = block
    end

    def actions(&block)
      @actions = block
    end

    def view_template
      yield self if block_given?

      header(**attrs(class: "w-full border-b border-border")) do
        div(data: {container: true}, class: "flex h-16 items-center gap-8") do
          div(class: "shrink-0") { @brand&.call }
          nav("aria-label": "Primary", data: {variant: :navbar}) { ul { @navigation&.call } }
          div(class: "ml-auto flex items-center gap-2") { @actions&.call }
        end
      end
    end
  end
end
