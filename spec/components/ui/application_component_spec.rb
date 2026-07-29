# frozen_string_literal: true

require "rails_helper"

RSpec.describe UI::ApplicationComponent, type: :component do
  it "uses dry-initializer for component options" do
    expect(UI::Button.dry_initializer.definitions.keys).to include(:variant, :size, :loading)
  end

  it "requires declared options" do
    expect { UI::Tooltip.new }.to raise_error(KeyError, /text/)
  end

  it "keeps undeclared keywords as HTML attributes" do
    output = UI::Badge.new(variant: :success, id: "status", class: "mt-2", data: {state: "ready"}).call { "Ready" }

    expect(output).to include('id="status"', "mt-2", 'data-state="ready"', "Ready")
  end
end
