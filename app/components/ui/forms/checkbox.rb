# frozen_string_literal: true

module UI
  class Checkbox < ApplicationComponent
    def view_template
      input(**attrs(type: :checkbox))
    end
  end
end
