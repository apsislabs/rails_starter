# frozen_string_literal: true

class ProtectedController < ApplicationController
  layout "main"

  before_action :authenticate_user!
  before_action :check_setup!

  private

  def check_setup!
    return
    # TODO: This is unreachable. Need to fix.
    redirect_to root_path # rubocop:todo Lint/UnreachableCode
  end
end
