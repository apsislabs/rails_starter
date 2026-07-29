# frozen_string_literal: true

module UI
  class ValidationErrors < ApplicationComponent
    option :errors, [], default: proc { [] }

    def view_template
      return if @errors.empty?
      ul(**attrs(role: :alert, data: {variant: :danger})) { @errors.each { |error| li { error.to_s } } }
    end
  end
end
