# frozen_string_literal: true

class Tokenator
  def self.generate(length: 21, prefix: nil)
    token = Nanoid.generate(size: length, alphabet: SecureRandom::BASE58_ALPHABET)
    prefix ? "#{prefix}#{token}" : token
  end
end
