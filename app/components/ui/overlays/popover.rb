# frozen_string_literal: true

module UI
  class Popover < ApplicationComponent
    option :id

    def trigger(&block)
      @trigger = block
    end

    def content(&block)
      @content = block
    end

    def view_template
      yield self if block_given?

      div(**attrs(class: "inline-block")) do
        button(type: :button, popovertarget: @id, style: "anchor-name: #{anchor_name}") { @trigger&.call }
        div(
          id: @id,
          popover: true,
          data: {anchored_popover: true},
          style: "position-anchor: #{anchor_name}"
        ) { @content&.call }
      end
    end

    private

    def anchor_name = @anchor_name ||= "--popover-#{object_id}"
  end
end
