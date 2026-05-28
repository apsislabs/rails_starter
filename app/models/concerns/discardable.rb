# frozen_string_literal: true

module Discardable
  extend ActiveSupport::Concern

  included do
    include Discard::Model

    default_scope -> { kept }

    alias_method :discarded, :discarded?
  end
end
