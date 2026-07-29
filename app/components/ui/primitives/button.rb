# frozen_string_literal: true

module UI
  class Button < ApplicationComponent
    VARIANTS = %i[neutral primary ghost danger link].freeze
    SIZES = %i[sm md lg].freeze

    option :variant, ->(variant) {
      raise ArgumentError, "unknown variant #{variant}" unless VARIANTS.include?(variant)

      variant
    }, default: proc { :neutral }
    option :size, ->(size) {
      raise ArgumentError, "unknown size #{size}" unless SIZES.include?(size)

      size
    }, default: proc { :md }
    option :type, default: proc { :button }
    option :href, default: proc {}
    option :disabled, default: proc { false }
    option :loading, default: proc { false }
    option :icon_only, default: proc { false }

    def view_template(&block)
      common = attrs(
        class: cn(
          "shrink-0",
          "aspect-square px-0" => @icon_only,
          "border-0 bg-transparent px-0 shadow-none underline underline-offset-4" => @variant == :link
        ),
        data: {
          variant: (@variant unless %i[neutral link].include?(@variant)),
          size: (@size unless @size == :md)
        }.compact,
        "aria-busy": @loading || nil
      )

      if @href
        a(**common, href: @href, role: "button",
          "aria-disabled": @disabled || nil,
          tabindex: (@disabled ? -1 : nil)) { content(&block) }
      else
        button(**common, type: @type, disabled: @disabled || @loading) { content(&block) }
      end
    end

    private

    def content(&block)
      render Spinner.new if @loading
      yield if block_given?
    end
  end
end
