# frozen_string_literal: true

require "dry/initializer"
require "tailwind_merge"

module UI
  # Shared base for the UI kit. All components accept `class:` plus arbitrary HTML attributes.
  class ApplicationComponent < Phlex::HTML
    extend Dry::Initializer
    include Phlex::Rails::Helpers::Routes

    class << self
      # Phlex's HTML DSL uses method names such as `tag` and `type`. Component
      # options are internal state, so readers stay disabled to avoid replacing
      # those rendering methods.
      def option(name, type = nil, reader: false, **options, &block)
        super
      end
    end

    # dry-initializer owns component options; everything else remains an HTML
    # attribute so callers can continue passing class:, data:, ARIA, and other
    # element attributes directly.
    def initialize(**options)
      definitions = self.class.dry_initializer.definitions
      @attributes = options.reject { |name, _value| definitions.key?(name) }
      __dry_initializer_initialize__(**options)
    end

    private

    def cn(*args)
      parts = args.flatten.compact.flat_map { |arg| arg.is_a?(Hash) ? arg.select { |_key, value| value }.keys : arg }.map(&:to_s)
      tailwind_merger.merge(parts.reject(&:empty?).join(" "))
    end

    def attrs(defaults = {}, extra = @attributes)
      extra = extra.dup
      extra_class = extra.delete(:class)
      extra_data = extra.delete(:data)
      merged_data = {**(defaults[:data] || {}), **(extra_data || {})}
      defaults.merge(extra).merge(class: cn(defaults[:class], extra_class).presence, data: merged_data.presence).reject { |_key, value| value.nil? }
    end

    def aria_label(label, decorative: false)
      decorative ? {"aria-hidden": true} : {"aria-label": label}
    end

    def render_tag(name, **attributes, &block)
      tag(name.to_sym, **attributes, &block)
    end

    def content
      yield if block_given?
    end

    def tailwind_merger
      @tailwind_merger ||= TailwindMerge::Merger.new
    end
  end
end
