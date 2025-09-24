# frozen_string_literal: true

require "data_uri"
require "json_date_parser"

# Load all extension files
Dir[Rails.root.join("lib/*_extensions.rb").to_s].each { |file| require file }
