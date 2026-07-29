# frozen_string_literal: true

require "rails_helper"

RSpec.describe UI::ApplicationComponent, type: :component do
  it "renders cards with base.css hooks and semantic regions" do
    card = UI::Card.new
    card.title { "Title" }
    card.body { "Body" }
    card.footer { "Footer" }
    expect(card.call).to include("data-card", "<header>", "Title", "Body", "<footer>", "Footer")
  end

  it "renders vertical stacks by default" do
    expect(UI::Stack.new.call { "Item" }).to include("flex-col")
  end

  it "supports horizontal wrapping stacks" do
    output = UI::Stack.new(direction: :horizontal, align: :center, wrap: true).call { "Item" }

    expect(output).to include("flex-row", "items-center", "flex-wrap")
  end

  it "delegates container sizing to base.css" do
    expect(UI::Container.new(size: :narrow).call { "Content" }).to include('data-container="narrow"', "Content")
  end
end
