# frozen_string_literal: true

module UI
  # A Modal anchored to the right edge as a full-height panel. Shares Modal's
  # title/body/footer slots, close button, and accessible-name guard —
  # only the panel's position/size differs.
  class Drawer < Modal
    private

    def dialog_variant = :drawer

    def close_label = "Close drawer"
  end
end
