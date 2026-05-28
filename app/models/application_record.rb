# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include EnumConstants

  primary_abstract_class

  before_create :generate_uuid_v7

  include PubliclyIdentifiable
  include AttributeStripper

  scope :at_random, -> { order("RANDOM()") }
  scope :most_recent_change, -> { order(updated_at: :desc, created_at: :desc) }

  private

  def generate_uuid_v7
    return if self.class.attribute_types["id"].type != :uuid

    self.id ||= SecureRandom.uuid_v7
  end
end
