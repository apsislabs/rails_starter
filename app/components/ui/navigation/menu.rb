# frozen_string_literal: true

module UI
  class Menu < ApplicationComponent
    option :items
    option :label, default: proc { "Menu" }

    def view_template
      nav(**attrs("aria-label": @label, data: {variant: :menu})) do
        ul do
          @items.each do |item|
            li do
              a(href: item[:href], "aria-current": ("page" if item[:current])) { item[:label] }
            end
          end
        end
      end
    end
  end
end
