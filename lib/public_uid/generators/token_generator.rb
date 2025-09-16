# frozen_string_literal: true

module PublicUid
  module Generators
    class TokenGenerator
      def initialize(length: 21, prefix: nil)
        @length = length
        @prefix = prefix
      end

      def generate
        Tokenator.generate
      end
    end
  end
end
