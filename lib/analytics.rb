require 'legato'

class Pageview
  extend Legato::Model

  metrics :pageviews
  dimensions :pagePath, :date
  filter :for_path, &lambda { |path| contains(:pagePath, path) }
end

class Analytics

  def initialize
    @start = Date.today
    @today = Date.today
    @path = 'json$'
  end

  def collection
    profile.pageview(start_date: @start, end_date: @today, sort: 'date').for_path(@path).collection
  end

  def result
    collection.inject(0) {|n, c| n += c.pageviews.to_i }
  end

  def user
    Legato::User.new(access_token)
  end

  def account
    user.accounts.select { |h| h.name == "Open Addresses Ltd." }.first
  end

  def profile
    account.profiles.select { |p| p.name == "https://alpha.openaddressesuk.org" }.first
  end

  def client
    OAuth2::Client.new(ENV['LEGATO_OAUTH_CLIENT_ID'], ENV['LEGATO_OAUTH_SECRET_KEY'], {
      :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
      :token_url => 'https://accounts.google.com/o/oauth2/token'
    })
  end

  def access_token
    OAuth2::AccessToken.from_hash client, {:access_token => ENV['LEGATO_OAUTH_ACCESS_TOKEN'] }
  end

end
