Rails.application.routes.draw do

  root to: 'addresses#index'

  resources :addresses

  get '/streets/:id' => "address_parts#show", as: "street"
  get '/localities/:id' => "address_parts#show", as: "locality"
  get '/towns/:id' => "address_parts#show", as: "town"
  get '/postcodes/:id' => "address_parts#show", as: "postcode"

  get '/postcode/:postcode' => 'addresses#index'

end
