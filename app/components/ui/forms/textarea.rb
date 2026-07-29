# frozen_string_literal: true

module UI
  class Textarea < ApplicationComponent
    option :invalid, default: proc { false }

    def view_template
      textarea(**attrs("aria-invalid": @invalid || nil)) { yield if block_given? }
    end
  end
end
