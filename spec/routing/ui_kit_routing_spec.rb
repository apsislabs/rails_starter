# frozen_string_literal: true

require "rails_helper"

RSpec.describe "UI kit routing" do
  it "is unavailable outside development" do
    expect(get: "/ui-kit").not_to be_routable
  end
end
