# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

def seed
  logger.info "Seeding database..."

  logger.info "Seeding users..."
  seed_user("admin@apsis.io", 'admin', 'Admin', 'Apsis')

  logger.info "Done"
end

def seed_user(email, pw, first_name, last_name)
  existing = User.find_by(email: email)
  return existing.account if existing

  account = Account.new({first_name: , last_name:})
  account.save(validate: false)

  user = User.new({ account: account, email: email, password: pw, confirmed_at: Time.zone.now })
  user.save(validate: false)
end

def logger
  @logger ||= ActiveSupport::TaggedLogging.new(Logger.new(STDOUT)).tagged("SEEDS")
end

seed()
