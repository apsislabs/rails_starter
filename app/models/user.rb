class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable

  publicly_identify prefix: :u
  auto_squish_attributes :email

  # Associations
  belongs_to :account, optional: true, inverse_of: :users

  # Validations
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: Devise.email_regexp
end
