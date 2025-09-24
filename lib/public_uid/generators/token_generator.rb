# frozen_string_literal: true

module PublicUid
  module Generators
    class TokenGenerator
      def initialize(length: 21, prefix: nil)
        @length = length
        @prefix = prefix
      end

      delegate :generate, to: :Tokenator
    end
  end
end
