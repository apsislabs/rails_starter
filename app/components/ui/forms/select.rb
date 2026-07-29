# frozen_string_literal: true

module UI
  class Select < ApplicationComponent
    option :options, default: proc {}
    option :groups, default: proc {}
    option :invalid, default: proc { false }

    def view_template
      select(**attrs("aria-invalid": @invalid || nil)) do
        Array(@options).each { |label, value| option(value: value) { label } }
        (@groups || {}).each { |group, options| optgroup(label: group) { options.each { |label, value| option(value: value) { label } } } }
        yield if block_given?
      end
    end
  end
end
