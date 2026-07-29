# frozen_string_literal: true

module UI
  class Input < ApplicationComponent
    TYPES = %i[text email password search number date url].freeze
    option :type, default: proc { :text }
    option :invalid, default: proc { false }

    def view_template
      input(**attrs(type: TYPES.include?(@type) ? @type : :text, "aria-invalid": @invalid || nil))
    end
  end
end
