# frozen_string_literal: true

module UI
  class Stack < ApplicationComponent
    DIRECTIONS = %i[vertical horizontal].freeze
    GAPS = [0, 1, 2, 3, 4, 5, 6, 8].freeze
    ALIGNMENTS = %i[start center end stretch baseline].freeze

    option :direction, ->(direction) {
      raise ArgumentError, "unknown direction #{direction} (expected one of #{DIRECTIONS.join(", ")})" unless DIRECTIONS.include?(direction)

      direction
    }, default: proc { :vertical }
    option :gap, ->(gap) {
      raise ArgumentError, "unknown gap #{gap} (expected one of #{GAPS.join(", ")})" unless GAPS.include?(gap)

      gap
    }, default: proc { 4 }
    option :align, ->(align) {
      raise ArgumentError, "unknown align #{align} (expected one of #{ALIGNMENTS.join(", ")})" unless ALIGNMENTS.include?(align)

      align
    }, default: proc { :stretch }
    option :wrap, default: proc { false }

    def view_template
      directions = {vertical: "flex-col", horizontal: "flex-row"}
      gaps = {0 => "gap-0", 1 => "gap-1", 2 => "gap-2", 3 => "gap-3", 4 => "gap-4", 5 => "gap-5", 6 => "gap-6", 8 => "gap-8"}
      alignments = {start: "items-start", center: "items-center", end: "items-end", stretch: "items-stretch", baseline: "items-baseline"}

      div(**attrs(class: cn("flex", directions.fetch(@direction), gaps.fetch(@gap), alignments.fetch(@align), "flex-wrap" => @wrap))) { yield }
    end
  end
end
