# frozen_string_literal: true

module UI
  class Code < ApplicationComponent
    option :block, default: proc { false }

    def view_template
      @block ? pre(**attrs) { code { yield } } : code(**attrs) { yield }
    end
  end
end
