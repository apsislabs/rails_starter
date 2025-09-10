class Account < ApplicationRecord
  # Associations
  has_many :users, inverse_of: :account, dependent: :nullify
end
