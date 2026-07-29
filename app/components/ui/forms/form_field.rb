# frozen_string_literal: true

module UI
  # Composes a rendered form control with its label, help text, and errors.
  # Pass Rails builder output or another UI control in the block.
  class FormField < ApplicationComponent
    option :label, default: proc {}
    option :for_id, default: proc {}
    option :required, default: proc { false }
    option :help_text, default: proc {}
    option :errors, [], default: proc { [] }

    def view_template
      div(**attrs(class: "space-y-2")) do
        render Label.new(for_id: @for_id, required: @required) { @label } if @label
        div { yield } if block_given?
        render HelpText.new { @help_text } if @help_text
        render ValidationErrors.new(errors: @errors)
      end
    end
  end
end
