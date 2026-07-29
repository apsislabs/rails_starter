# frozen_string_literal: true

module UI
  class Breadcrumb < ApplicationComponent
    option :items

    def view_template
      nav(**attrs("aria-label": "Breadcrumb", data: {variant: :breadcrumb})) do
        ul do
          @items.each do |item|
            li do
              if item[:href]
                a(href: item[:href], "aria-current": ("page" if item[:current])) { item[:label] }
              else
                span("aria-current": "page") { item[:label] }
              end
            end
          end
        end
      end
    end
  end
end
