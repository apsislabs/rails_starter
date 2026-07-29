# frozen_string_literal: true

module UI
  class Progress < ApplicationComponent
    option :value, default: proc {}
    option :max, default: proc { 100 }
    option :label, default: proc { "Progress" }

    def view_template
      progress(**attrs(value: @value, max: @max, "aria-label": @label)) { "#{@value || 0} / #{@max}" }
    end
  end
end
