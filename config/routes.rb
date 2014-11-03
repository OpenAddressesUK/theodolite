Rails.application.routes.draw do

  resources :addresses

  get '/addresses/:town/:locality/:postcode/:street/:pao/:sao' => 'addresses#query'

end
