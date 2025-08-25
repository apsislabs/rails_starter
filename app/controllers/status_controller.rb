# frozen_string_literal: true

class StatusController < ApplicationController
  def index
    render json: {environment: Rails.application.config.display_env, status: "ok"}, status: :ok
  end
end
