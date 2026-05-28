module Activable
  extend ActiveSupport::Concern

  included do
    include Toggleable

    toggleable :active, negative: :inactive, verb: :activate, negative_verb: :deactivate
  end
end
