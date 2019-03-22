# frozen_string_literal: true

namespace :shared do
  desc 'Stop, if on production'
  task :no_prod do
    puts 'This task cannot be run on production'
    exit if Rails.env.production?
  end
end
