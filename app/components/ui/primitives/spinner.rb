# frozen_string_literal: true

module UI
  class Spinner < ApplicationComponent
    option :label, default: proc { "Loading" }

    def view_template
      span(**attrs(class: "inline-block size-4 animate-spin rounded-full border-2 border-current border-r-transparent", role: "status")) { span(class: "sr-only") { @label } }
    end
  end
end
