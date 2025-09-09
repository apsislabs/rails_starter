# frozen_string_literal: true

namespace :db do
  desc "›› Checks to see if the database exists"
  task exists: :environment do
    ActiveRecord::Base.connection
  rescue ActiveRecord::NoDatabaseError
    puts "DB Does not exist."
    exit 1
  else
    puts "DB Exists."
    exit 0
  end

  desc "›› Recreates the database with new seed data"
  task recreate: ["shared:no_prod", "db:drop", "db:create", "db:migrate"] do
    puts 'Database Recreated. Execute "rails db:seed" to reseed.'
  end
end
