# frozen_string_literal: true

HighVoltage.configure do |config|
  config.home_page = "home"
  config.route_drawer = HighVoltage::RouteDrawers::Root
  config.layout = "page"
end
