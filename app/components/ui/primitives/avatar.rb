# frozen_string_literal: true

module UI
  class Avatar < ApplicationComponent
    option :src, default: proc {}
    option :alt, default: proc {}
    option :initials, default: proc {}
    option :size, default: proc { :md }

    def view_template
      sizes = {sm: "size-8 text-xs", md: "size-10 text-sm", lg: "size-12 text-base"}
      span(**attrs(class: cn("inline-flex shrink-0 items-center justify-center overflow-hidden rounded-full bg-surface-muted font-medium text-foreground", sizes.fetch(@size)))) do
        if @src
          img(src: @src, alt: @alt || "", class: "size-full object-cover")
        elsif @initials
          plain @initials
        else
          render Icon.new(name: :user, decorative: true)
        end
      end
    end
  end
end
