require 'angerfist'

Rails.application.config.middleware.use(AngerFist, ENV['GA_TRACKER_ID'], ENV['GA_DOMAIN'])
