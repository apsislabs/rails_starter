# frozen_string_literal: true

module UI
  class Modal < ApplicationComponent
    option :open, default: proc { false }
    option :label, default: proc {}

    def trigger(&block)
      @trigger = block
    end

    def title(&block)
      @title = block
    end

    def body(&block)
      @body = block
    end

    def footer(&block)
      @footer = block
    end

    def view_template
      yield self if block_given?
      raise ArgumentError, "#{self.class} needs either label: or a title block for an accessible name" if @label.nil? && @title.nil?

      div(data: {controller: "modal", modal_open_value: @open}) do
        button(type: :button, data: {action: "modal#open"}) { @trigger.call } if @trigger
        dialog(**attrs(
          "aria-label": (@label if @title.nil?),
          "aria-labelledby": (title_id if @title),
          data: {
            variant: dialog_variant,
            modal_target: "dialog",
            action: "click->modal#backdropClose cancel->modal#close"
          }.compact
        )) do
          render_tag(:header) do
            @title ? h2(id: title_id) { @title.call } : span
            close_button
          end
          div(class: "flex-1") { @body&.call }
          render_tag(:footer) { @footer.call } if @footer
        end
      end
    end

    private

    def title_id = @title_id ||= "modal-title-#{object_id}"
    def dialog_variant = nil
    def close_label = "Close dialog"

    def close_button
      button(
        type: :button,
        "aria-label": close_label,
        title: "Close",
        class: "shrink-0 rounded-full p-1.5",
        data: {variant: :ghost, action: "modal#close"}
      ) { plain "×" }
    end
  end
end
