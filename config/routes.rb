Rails.application.routes.draw do

  resources :addresses

  get '/streets/:id' => "address_parts#street", as: "street"
  get '/localities/:id' => "address_parts#locality", as: "locality"
  get '/towns/:id' => "address_parts#town", as: "town"
  get '/postcodes/:id' => "address_parts#postcode", as: "postcode"

  get '/postcode/:postcode' => 'addresses#index'

  get '/download', to: redirect('/data')

  root to: 'jekylly/static#show', defaults: { path: 'main' }
  mount Jekylly::Engine, at: "/"

end
