# frozen_string_literal: true

require "rails_helper"

RSpec.describe UI::ApplicationComponent, type: :component do
  it "renders native progress markup" do
    output = UI::Progress.new(value: 40, max: 100, label: "Upload").call

    expect(output).to include('<progress value="40" max="100" aria-label="Upload"')
  end

  it "leaves code presentation to semantic base styles" do
    output = UI::Code.new(block: true).call { "puts :ok" }

    expect(output).to eq("<pre><code>puts :ok</code></pre>")
  end
end
