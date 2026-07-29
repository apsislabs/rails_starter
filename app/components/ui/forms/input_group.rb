# frozen_string_literal: true

module UI
  class InputGroup < ApplicationComponent
    option :prefix, default: proc {}
    option :suffix, default: proc {}

    def view_template
      div(**attrs(class: "control-surface flex overflow-hidden focus-within:control-ring")) do
        adornment(@prefix, "border-r border-border") if @prefix
        div(class: "min-w-0 flex-1 [&>input]:border-0 [&>input]:shadow-none [&>input]:focus:ring-0") { yield if block_given? }
        adornment(@suffix, "border-l border-border") if @suffix
      end
    end

    private

    def adornment(content, border_class)
      span(class: cn("flex items-center px-3 text-sm text-muted-foreground", border_class)) do
        content.respond_to?(:call) ? content.call : plain(content.to_s)
      end
    end
  end
end
