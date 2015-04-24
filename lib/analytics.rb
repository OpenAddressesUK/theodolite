require 'legato'
require 'oauth2'
require 'jiffybag'

Dotenv.load

class Pageview
  extend Legato::Model

  metrics :pageviews
  dimensions :pagePath, :date
  filter :for_path, &lambda { |path| contains(:pagePath, path) }
end

class Analytics

  def initialize(options = {})
    @start = Date.today
    @today = Date.today
    @path = options[:path]
    @profile = options[:profile] || "All Web Site Data"
    @property = options[:property] || "Open Addresses"
  end

  def collection
    if @path
      profile.pageview(start_date: @start, end_date: @today, sort: 'date').for_path(@path).collection
    else
      profile.pageview(start_date: @start, end_date: @today, sort: 'date').collection
    end
  end

  def result
    collection.inject(0) {|n, c| n += c.pageviews.to_i }
  end

  def user
    Legato::User.new(access_token)
  end

  def account
    select_resource(user.accounts, "Open Addresses Ltd.")
  end

  def property
    select_resource(account.web_properties, @property)
  end

  def profile
    select_resource(property.profiles, @profile)
  end

  def client
    OAuth2::Client.new(ENV['LEGATO_OAUTH_CLIENT_ID'], ENV['LEGATO_OAUTH_SECRET_KEY'], {
      :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
      :token_url => 'https://accounts.google.com/o/oauth2/token'
    })
  end

  def access_token
    access = OAuth2::AccessToken.from_hash client, {:refresh_token => ENV['LEGATO_OAUTH_REFRESH_TOKEN'] }
    access.refresh!
  end

  def select_resource(resource, name)
    resource.select { |r| r.name == name }.first
  end

end
