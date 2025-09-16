class Account < ApplicationRecord
  has_person_name

  # Associations
  has_many :users, inverse_of: :account, dependent: :nullify

  publicly_identify prefix: :acc
  auto_squish_attributes :first_name, :last_name
end
