require 'date'

module JsonDateParser
  # Tries to parse into a Date (ignores time)
  def self.parse_date(value)
    return if value.nil? || value.strip.empty?

    try_parsers(value, [
      ->(v) { Date.iso8601(v) },
      ->(v) { Date.strptime(v, '%m/%d/%Y') },   # e.g. 09/16/2025
      ->(v) { Date.strptime(v, '%Y/%m/%d') },   # e.g. 2025/09/16
      ->(v) { Date.parse(v) }                   # very loose fallback
    ])
  end

  # Tries to parse into a DateTime (keeps time if present)
  def self.parse_datetime(value)
    return if value.nil? || value.strip.empty?

    try_parsers(value, [
      ->(v) { DateTime.iso8601(v) },
      ->(v) { DateTime.strptime(v, '%m/%d/%Y %H:%M:%S') }, # e.g. 09/16/2025 13:45:00
      ->(v) { DateTime.parse(v) }                         # loose fallback
    ])
  end

  private

  def self.try_parsers(value, parsers)
    parsers.each do |parser|
      begin
        return parser.call(value)
      rescue ArgumentError
        next
      end
    end
    nil
  end
end
