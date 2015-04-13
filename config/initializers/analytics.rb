Rails.application.config.middleware.use(Rack::Tracker) do
  handler :google_analytics, { tracker: JiffyBag['GA_TRACKER_ID'] }
end
