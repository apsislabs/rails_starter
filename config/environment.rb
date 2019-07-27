# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'simple_rails_configurator'

SimpleRailsConfigurator.configure!

# Initialize the Rails application.
Rails.application.initialize!
