# frozen_string_literal: true

module UI
  class Tabs < ApplicationComponent
    option :items
    option :selected, ->(selected, component) { selected || component.instance_variable_get(:@items).first&.fetch(:id) }, default: proc { @items.first&.fetch(:id) }

    def view_template
      div(**attrs(data: {controller: "tabs"})) do
        nav(data: {variant: :tabs}, "aria-label": "Sections") do
          ul(role: :tablist) do
            @items.each do |item|
              li(role: :presentation) do
                button(
                  id: "tab-#{item[:id]}", type: :button, role: :tab, "aria-selected": (item[:id] == @selected).to_s,
                  "aria-controls": "panel-#{item[:id]}", tabindex: ((item[:id] == @selected) ? 0 : -1),
                  data: {tabs_target: "tab", action: "click->tabs#select keydown->tabs#navigate"}
                ) { item[:label] }
              end
            end
          end
        end
        @items.each do |item|
          div(
            id: "panel-#{item[:id]}", role: :tabpanel, "aria-labelledby": "tab-#{item[:id]}",
            hidden: item[:id] != @selected, class: "pt-4", data: {tabs_target: "panel"}
          ) { item[:content].respond_to?(:call) ? item[:content].call : plain(item[:content].to_s) }
        end
      end
    end
  end
end
