# frozen_string_literal: true

class UiKitController < ApplicationController
  def index
    raise ActionController::RoutingError, "Not Found" unless Rails.env.development?
  end
end
