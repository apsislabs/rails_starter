# frozen_string_literal: true

require "public_uid/generators/token_generator"

module PubliclyIdentifiable
  extend ActiveSupport::Concern

  included do
    def self.publicly_identify(prefix: nil)
      include PublicUid::ModelConcern

      generate_public_uid generator: PublicUid::Generators::TokenGenerator.new(prefix: prefix ? "#{prefix}_" : nil)

      after_initialize :ensure_public_uid!, if: -> { public_uid.blank? }
      before_validation :ensure_public_uid!, if: -> { public_uid.blank? }

      validates :public_uid, presence: true
    end

    # Reset to use the default ID as our routing param
    # because Friendly ID does some nonsense
    def to_param
      id.to_s
    end

    protected

    def ensure_public_uid!
      return if public_uid.present?

      self.public_uid = generate_uid! if has_attribute?(:public_uid) && public_uid.blank?
      save! if persisted?
    end
  end
end
