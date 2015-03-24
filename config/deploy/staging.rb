server "error-shared1.hosts.errorstudio.com", :web, :app
server "error-shared1.hosts.errorstudio.com", :db, :primary => true
set :primary_domain, "theodlite"
set :site_aliases, %w() #stick anything in here which will resolve to this site - will redirect to the primary domain
set :server_aliases, [primary_domain, site_aliases].flatten.join(" ")
set :rails_env, :staging
set :branch, "development"
set :passenger_port, 8098
