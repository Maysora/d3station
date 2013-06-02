Airbrake.configure do |config|
  config.api_key = ENV["AIRBRAKE_KEY"]
  config.host    = ENV["AIRBRAKE_HOST"]
  config.port    = ENV["AIRBRAKE_PORT"] || 80
  config.secure  = config.port == 443
end