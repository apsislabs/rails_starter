# frozen_string_literal: true

module UI
  class EmptyState < ApplicationComponent
    def icon(&block)
      @icon = block
    end

    def title(&block)
      @title = block
    end

    def description(&block)
      @description = block
    end

    def actions(&block)
      @actions = block
    end

    def view_template
      yield self if block_given?

      section(**attrs(class: "py-12 text-center")) do
        div(class: "mx-auto mb-4 text-muted-foreground") { @icon&.call } if @icon
        h2(class: "m-0 text-lg") { @title&.call }
        p(class: "mx-auto mt-2 max-w-md text-sm text-muted-foreground") { @description&.call }
        footer(class: "mt-5 flex justify-center gap-3") { @actions&.call } if @actions
      end
    end
  end
end
