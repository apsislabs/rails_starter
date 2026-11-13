# frozen_string_literal: true

require "rails_helper"

# The spec suite must always boot in the test environment, even when a
# RAILS_ENV is inherited from the shell (e.g. `RAILS_ENV=development`). Booting
# in another environment would point `maintain_test_schema!` and the
# transactional fixtures at the wrong database and can destroy real data.
RSpec.describe "spec environment" do # rubocop:disable RSpec/DescribeClass
  it "always runs in the test environment" do
    expect(Rails.env.test?).to be(true)
  end

  it "connects to a test database" do
    database = ActiveRecord::Base.connection_db_config.database
    expect(database).to end_with("_test")
  end
end
