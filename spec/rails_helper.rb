# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'webmock/rspec'

Dotenv.load

ENV["MONGOID_ENVIRONMENT"] = "test"

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.maintain_test_schema!

# Disable net connection apart from localhost
WebMock.disable_net_connect!(:allow_localhost => true)


RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  FactoryGirl.definition_file_paths = ["#{Gem.loaded_specs['mongoid_address_models'].full_gem_path}/lib/mongoid_address_models/factories"]
  FactoryGirl.find_definitions

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].clean_with(:truncation)
    Town.es.index.reset
    Locality.es.index.reset
  end

  config.before(:each) do
    DatabaseCleaner.start
    Address.create_indexes
    Street.create_indexes
    Postcode.create_indexes
    Locality.create_indexes
    Town.create_indexes
    Town.es.index.reset
    Locality.es.index.reset
  end

  config.after(:each) do
    DatabaseCleaner.clean
    Town.es.index.reset
    Locality.es.index.reset
  end
end
