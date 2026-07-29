# frozen_string_literal: true

module UI
  class Alert < ApplicationComponent
    option :variant, default: proc { :info }

    def view_template
      div(**attrs(role: :alert, data: {variant: @variant})) { yield }
    end
  end
end
