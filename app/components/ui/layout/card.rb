# frozen_string_literal: true

module UI
  class Card < ApplicationComponent
    def header(&block)
      @header = block
    end

    def body(&block)
      @body = block
    end

    def footer(&block)
      @footer = block
    end

    def title(&block)
      @title = block
    end

    def subtitle(&block)
      @subtitle = block
    end

    def view_template
      yield self if block_given?

      section(**attrs(data: {card: true})) do
        if @header || @title || @subtitle
          render_tag(:header) do
            @header&.call
            h2 { @title.call } if @title
            p { @subtitle.call } if @subtitle
          end
        end
        div { @body&.call }
        render_tag(:footer) { @footer.call } if @footer
      end
    end
  end
end
