# frozen_string_literal: true

require "data_uri"
require "json_date_parser"

# Load all extension files
Dir["#{Rails.root}/lib/*_extensions.rb"].each { |file| require file }
