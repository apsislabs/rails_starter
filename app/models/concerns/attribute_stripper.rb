# frozen_string_literal: true

module AttributeStripper
  extend ActiveSupport::Concern

  included do
    def self.auto_squish_attributes(*attrs, with: nil)
      attrs.each do |attr|
        normalizes attr,
          with: ->(a) do
            x = a.squish
            x = with.call(x) if with.present? && with.respond_to?(:call)
            x
          end
      end
    end
  end
end
