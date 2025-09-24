
if Rails.env.development?
  require "rack-mini-profiler"

  Rack::MiniProfiler.config.position = "bottom-left"
end
