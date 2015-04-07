Rails.application.routes.draw do

  get '/addresses/download' => "addresses#download"

  resources :addresses

  get '/streets' => "address_parts#streets", as: "streets"
  get '/streets/:id' => "address_parts#street", as: "street"
  get '/localities' => "address_parts#localities", as: "localities"
  get '/localities/:id' => "address_parts#locality", as: "locality"
  get '/towns' => "address_parts#towns", as: "towns"
  get '/towns/:id' => "address_parts#town", as: "town"
  get '/postcodes' => "address_parts#postcodes", as: "postcodes"
  get '/postcodes/:id' => "address_parts#postcode", as: "postcode"

  get '/postcode/:postcode' => 'addresses#index'

  get '/download', to: redirect('/data')
  get '/torrent' => "application#get_torrent"

  root to: 'jekylly/static#show', defaults: { path: 'main' }
  mount Jekylly::Engine, at: "/"

end
