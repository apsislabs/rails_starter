# frozen_string_literal: true

module UI
  class Table < ApplicationComponent
    def header(&block)
      @header = block
    end

    def body(&block)
      @body = block
    end

    def footer(&block)
      @footer = block
    end

    def empty(&block)
      @empty = block
    end

    def view_template
      yield self if block_given?

      div(class: "w-full overflow-x-auto") do
        table(**attrs) do
          thead { @header&.call } if @header
          tbody { @body ? @body.call : @empty&.call }
          tfoot { @footer.call } if @footer
        end
      end
    end
  end
end
