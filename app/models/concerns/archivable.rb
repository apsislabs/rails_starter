module Archivable
  extend ActiveSupport::Concern

  included do
    include Toggleable

    toggleable :archived, negative: :unarchived, verb: :archive, negative_verb: :unarchive, negative_values: [false, nil]
  end
end
