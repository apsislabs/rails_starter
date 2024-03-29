# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0'

# Defaults
# -------------------------------------

gem 'bootsnap', '>= 1.3.2', require: false
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 1.2.3'
# gem 'mysql2', '~> 0.5.3' # SWITCH MYSQL: to toggle from Postgres to MySQL
gem 'puma'
gem 'redis'
gem 'tzinfo-data'

# Extended Functionality
# -------------------------------------

# gem 'aasm'                        # => state machine management
gem 'active_model_serializers'      # => serialized models
# gem 'activejob-traffic_control'   # => better active_jobs
gem 'aws-sdk-s3', '~> 1'            # => aws
# gem 'carrierwave'                 # => file uploads
gem 'discard'                       # => soft delete support
gem 'flutie'                        # => i18n title elements
gem 'groupdate'                     # => group queries by date
gem 'kaminari'                      # => active model pagination
gem 'lograge'                       # => better logging
gem 'oj'                            # => improved json
gem 'olive_branch'                  # => improved api casing
gem 'rack-attack'                   # => request throttler
gem 'rack-cors'                     # => CORs header manipulation for js access
gem 'retryable'                     # => safely retry blocks
gem 'roadie-rails'                  # => inline css for emails
gem 'search_cop'                    # => active model natural language search
gem 'sidekiq'                       # => active_job processor
gem 'silencer'                      # => silence noisy rails logging
# gem 'simple_form'                 # => form markup generator
gem 'stringex'                      # => string extensions
gem 'strong_migrations'             # => protect from dangerous migrations
gem 'validates'                     # => extended model validations

# Custom Configs
gem 'simple_rails_configurator'

# Slayer
gem 'slayer', '0.5.0.beta'       # => a killer service layer
gem 'slayer_rails', '0.5.0.beta' # => rails bindings for slayer

# Auth & Authorization
# -------------------------------------

gem 'devise'
gem 'papers_please'
gem 'tiddle'

# Admin

gem 'administrate'

# Optional
# -------------------------------------
# Many of these gems require some level of configuration
# that doesn't happen automatically. If you are enabling
# one of these gems, please be sure to read its
# documentation to ensure proper setup.

# gem 'action-store'            # => simple actions for models
# gem 'acts-as-taggable-on'     # => tagging for models
# gem 'acts_as_tenant'          # => simple tenanting
# gem 'audited'                 # => audit logging
# gem 'blazer'                  # => reporting dashboard
# gem 'boring_presenters'       # => simple presentation
# gem 'chewy'                   # => elastic-search indexing
# gem 'country_select'          # => translated country dropdown
# gem 'exception_notification'  # => Email Exceptions
# gem 'field_test'              # => a/b testing
# gem 'friendly_id'             # => friendly permalinks
# gem 'globalize'               # => activerecord translations
# gem 'mainstreet'              # => a standard address model
# gem 'mini_magick'             # => image manipulation
# gem 'money-rails',            # => money manipulation
# gem 'pg_search'               # => pg-based search
# gem 'phi_attrs'               # => phi logging and access control
# gem 'pretender'               # => user impersonation
# gem 'ranked-model'            # => sorting for models
# gem 'ransack'                 # => ruby-based search
# gem 'responders'              # => automated responders
# gem 'rollbar'                 # => rollbar reporting
# gem 'safely_block'            # => safely execute blocks
# gem 'scenic'                  # => save views in schema.rb. Supports postgress by default and requires adapters for other dbms
# gem 'scenic-mysql_adapter'    # => scenic if using mysql
# gem 'stripe'                  # => interaction with Stripe
# gem 'wicked_pdf'              # => PDF generation

# Environment Groups
# -------------------------------------
group :production do
  gem 'uglifier'
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'prettier'
  gem 'rename'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  # gem 'i18n-tasks' # Disabling to silence parser warning https://github.com/glebm/i18n-tasks/issues/472
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-mini-profiler'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'mocha'
  gem 'response_code_matchers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
end
