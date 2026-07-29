# frozen_string_literal: true

module UI
  class List < ApplicationComponent
    option :ordered, default: proc { false }

    def view_template
      render_tag(@ordered ? :ol : :ul, **attrs(class: "divide-y divide-border")) { yield }
    end
  end
end
