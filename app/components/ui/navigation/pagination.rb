# frozen_string_literal: true

module UI
  class Pagination < ApplicationComponent
    option :current, proc(&:to_i)
    option :total, proc(&:to_i)
    option :url_for

    def view_template
      nav(**attrs("aria-label": "Pagination", data: {variant: :pagination})) do
        ul do
          (1..@total).each do |page|
            li do
              a(href: @url_for.call(page), "aria-current": ("page" if page == @current), "aria-label": "Page #{page}") { page.to_s }
            end
          end
        end
      end
    end
  end
end
