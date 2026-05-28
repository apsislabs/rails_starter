# frozen_string_literal: true

# This file should ensure the existence of records required to run the application
# in every environment. Keep it idempotent.
#
# Load with:
#   bin/rails db:seed

class Seeder
  DEFAULT_USERS = [
    {
      email: "admin@apsis.io",
      password: "admin",
      first_name: "Admin",
      last_name: "Apsis"
    }
  ].freeze

  def self.run
    new.run
  end

  def run
    logger.info "Seeding database..."

    logger.info "Seeding users..."
    DEFAULT_USERS.each do |attributes|
      seed_user(**attributes)
    end

    logger.info "Done"
  end

  private

  def seed_user(email:, password:, first_name:, last_name:)
    existing = User.find_by(email:)
    return existing.account if existing

    account = Account.new(first_name:, last_name:)
    account.save!(validate: false)

    User.create!(
      account:,
      email:,
      password:,
      password_confirmation: password,
      confirmed_at: Time.current
    )
  end

  def logger
    @logger ||= ActiveSupport::TaggedLogging
      .new(Logger.new($stdout))
      .tagged("SEEDS")
  end
end

Seeder.run
