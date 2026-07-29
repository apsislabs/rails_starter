# frozen_string_literal: true

module UI
  class HelpText < ApplicationComponent
    def view_template
      small(**attrs) { yield }
    end
  end
end
