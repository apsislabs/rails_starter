source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

# Defaults
# -------------------------------------

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'tzinfo-data'

# Extended Functionality
# -------------------------------------

gem 'aasm'                        # => state machine management
gem 'active_model_serializers'    # => serialized models
gem 'activejob-traffic_control'   # => better active_jobs
gem 'aws-sdk-s3'                  # => aws
gem 'carrierwave'                 # => file uploads
gem 'flutie'                      # => i18n title elements
gem 'groupdate'                   # => group queries by date
gem 'kaminari'                    # => active model pagination
gem 'lograge'                     # => better logging
gem 'paranoia'                    # => soft delete support
gem 'rack-attack'                 # => request throttler
gem 'retryable'                   # => safely retry blocks
gem 'roadie-rails'                # => inline css for emails
gem 'secure_headers'              # => send secure headers
gem 'sidekiq'                     # => active_job processor
gem 'simple_form'                 # => form markup generator
gem 'slayer'                      # => a killer service layer
gem 'slayer_rails'                # => rails bindings for slayer
gem 'stringex'                    # => string extensions
gem 'strong_migrations'           # => protect from dangerous migrations
gem 'validates'                   # => extended model validations

# Auth & Authorization
# -------------------------------------

gem 'pundit'
gem 'sorcery'

gem 'rack-cors'           # => CORs header manipulation for js access

# Optional
# -------------------------------------
# Many of these gems require some level of configuration
# that doesn't happen automatically. If you are enabling
# one of these gems, please be sure to read its
# documentation to ensure proper setup.

# gem 'action-store'          # => simple actions for models
# gem 'acts-as-taggable-on'   # => tagging for models
# gem 'acts_as_tenant'        # => simple tenanting
# gem 'administrate'          # => admin panels
# gem 'audited'               # => audit logging
# gem 'blazer'                # => reporting dashboard
# gem 'boring_presenters'     # => simple presentation
# gem 'chewy'                 # => elastic-search indexing
# gem 'country_select'        # => translated country dropdown
# gem 'field_test'            # => a/b testing
# gem 'friendly_id'           # => friendly permalinks
# gem 'globalize'             # => activerecord translations
# gem 'mainstreet'            # => a standard address model
# gem 'mini_magick'           # => image manipulation
# gem 'money-rails', '~>1'    # => money manipulation
# gem 'pg_search'             # => pg-based search
# gem 'phi_attrs'             # => phi logging and access control
# gem 'pretender'             # => user impersonation
# gem 'ranked-model'          # => sorting for models
# gem 'ransack'               # => ruby-based search
# gem 'responders'            # => automated responders
# gem 'rollbar'               # => rollbar reporting
# gem 'safely_block'          # => safely execute blocks
# gem 'stripe'                # => interaction with Stripe
# gem 'wicked_pdf'            # => PDF generation

# Environment Groups
# -------------------------------------

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.1.0'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rename'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'i18n-tasks'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-mini-profiler'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'mocha'
  gem 'response_code_matchers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
end
