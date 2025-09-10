class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable

  # Associations
  belongs_to :account, optional: true, inverse_of: :users

  # Validations
  validates :email, presence: true, format: Devise.email_regexp
end
