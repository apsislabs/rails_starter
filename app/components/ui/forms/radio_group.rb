# frozen_string_literal: true

module UI
  class RadioGroup < ApplicationComponent
    option :label, default: proc {}

    def view_template
      fieldset(**attrs) {
        legend { @label } if @label
        yield
      }
    end
  end
end
