config = {
  tracker_id: JiffyBag['GA_TRACKER_ID'],
  domain: JiffyBag['GA_DOMAIN'],
  content_types: ["application/json"],
  paths: ["/torrent"]
}

Rails.application.config.middleware.use(Rack::Angerfist, config)
