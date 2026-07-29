# frozen_string_literal: true

module UI
  class DescriptionList < ApplicationComponent
    option :items

    def view_template
      dl(**attrs(class: "divide-y divide-border")) do
        @items.each do |term, description|
          div(class: "grid gap-1 py-3 sm:grid-cols-3 sm:gap-4") do
            dt(class: "text-sm font-medium text-foreground") { term }
            dd(class: "text-sm text-muted-foreground sm:col-span-2") { description }
          end
        end
      end
    end
  end
end
