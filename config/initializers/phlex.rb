# frozen_string_literal: true

module Views
end

module Components
  extend Phlex::Kit
end

module UI
  extend Phlex::Kit
end

Rails.autoloaders.main.push_dir(
  Rails.root.join("app/views"), namespace: Views
)

Rails.autoloaders.main.push_dir(
  Rails.root.join("app/components"), namespace: Components
)

# The kit has a compact public API (`UI::Button`) while retaining category
# directories for discoverability.
ui_root = Rails.root.join("app/components/ui")
Rails.autoloaders.main.push_dir(ui_root, namespace: UI)
Rails.autoloaders.main.collapse(*%w[primitives layout forms navigation feedback overlays data typography].map { |directory| ui_root.join(directory) })
