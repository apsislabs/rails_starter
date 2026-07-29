# frozen_string_literal: true

module UI
  class Link < ApplicationComponent
    option :href
    option :external, ->(external, component) { external.nil? ? component.instance_variable_get(:@href).start_with?("http") : external }, default: proc { @href.start_with?("http") }

    def view_template
      a(**attrs(href: @href, target: (@external ? "_blank" : nil), rel: (@external ? "noopener noreferrer" : nil))) { yield }
    end
  end
end
