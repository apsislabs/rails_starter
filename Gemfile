# frozen_string_literal: true

source "https://rubygems.org"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 8.0"

# Defaults
# -------------------------------------

gem "bootsnap", require: false
gem "irb", require: false # Updates default Ruby irb
gem "pg"
gem "puma", ">= 5.0"
gem "tzinfo-data"
gem "image_processing"
gem "bcrypt"
gem "aws-sdk-s3", require: false

# Assets
# -------------------------------------
gem "propshaft"

gem "vite_rails"

# Solids
# -------------------------------------

gem "solid_queue"
gem "solid_cache"
gem "solid_cable"

# Extended Functionality
# -------------------------------------

gem "after_commit_everywhere"       # => after commit blocks
gem "ar_lazy_preload"               # => lazy preloading associations
gem "database_validations"          # => move validations to database
gem "discard"                       # => soft delete support
gem "fast_page"                     # => faster paging
gem "feature_toggles"               # => feature flags
gem "flutie"                        # => i18n title elements
gem "groupdate"                     # => group queries by date
gem "high_voltage"                  # => static pages
gem "lograge"                       # => better logging
gem "maintenance_tasks"             # => better tasks
gem "oj"                            # => improved json
gem "pagy"                          # => active model pagination
gem "panko_serializer"              # => serialized models
gem "phlex-rails"                   # => better views
gem "premailer-rails"               # => inline css for emails
gem "rack-attack"                   # => request throttler
gem "rack-cors"                     # => CORs header manipulation for js access
gem "retriable"                     # => safely retry blocks
gem "search_cop"                    # => active model natural language search
gem "store_attribute"               # => store typed attributes in JSON
gem "store_model"                   # => store typed models in JSON
gem "stringex"                      # => string extensions
gem "strong_migrations"             # => protect from dangerous migrations
gem "versionist"                    # => API versioning

gem "silencer", require: ["silencer/rails/logger"]

# IDs
gem "public_uid"
gem "nanoid"

# Normalized Attributes
gem "phony_rails"
gem "name_of_person"

# Custom Configs
gem "simple_rails_configurator"

# Slayer
gem "slayer", "~> 0.5"       # => a killer service layer
gem "slayer_rails", "~> 0.5" # => rails bindings for slayer

# Auth & Authorization
# -------------------------------------

gem "devise"
gem "papers_please"
gem "pretender"
# gem 'authtrail'

# Geocoding
# gem "geocoder"
# gem "maxminddb"

# Admin
# -------------------------------------
# gem 'administrate'
# gem "administrate-field-active_storage"

# Optional
# -------------------------------------
# Many of these gems require some level of configuration
# that doesn't happen automatically. If you are enabling
# one of these gems, please be sure to read its
# documentation to ensure proper setup.

# gem 'active_storage_base64'       # => base64 attachments
# gem 'active_storage_validations'  # => active storage validators
# gem 'activerecord-import'         # => bulk import of models
# gem 'audited'                     # => audit logging
# gem 'blazer'                      # => reporting dashboard
# gem 'blind_index'                 # => indexing on encrypted columns
# gem 'deep_cloneable'              # => active-record cloning
# gem 'chronic'                     # => date parsing
# gem 'lockbox'                     # => column-level encryption
# gem 'mini_magick'                 # => image manipulation
# gem 'pay'                         # => payment processing
# gem 'phi_attrs'                   # => phi logging and access control
# gem 'ranked-model'                # => sorting for models
# gem 'scenic-mysql_adapter'        # => scenic if using mysql
# gem 'scenic'                      # => save views in schema.rb. Supports postgress by default and requires adapters for other dbms
# gem 'simple_form'                 # => form markup generator

# Environment Groups
# -------------------------------------
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "dotenv-rails"
  gem "faker"
  gem "factory_bot_instruments" # => debug factories
  gem "factory_bot_rails"
  gem "rspec_junit_formatter"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-i18n", require: false
  gem "rubocop-performance", require: false
  gem "standard", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rspec_rails", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman", require: false
  gem "database_consistency", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rack-mini-profiler"
  gem "rename"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring"
  gem "syntax_tree-haml"
  gem "syntax_tree-rbs"
  gem "syntax_tree"

  # Temporary bugfix
  gem "mutex_m", group: :development
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
  gem "parallel_tests"
  gem "simplecov", require: false
end
