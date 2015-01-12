require 'angerfist'

config = {
  tracker_id: ENV['GA_TRACKER_ID'],
  domain: ENV['GA_DOMAIN'],
  content_types: ["application/json"],
  paths: ["/torrent"]
}

Rails.application.config.middleware.use(AngerFist, config)
