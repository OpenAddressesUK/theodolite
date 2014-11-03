Rails.application.routes.draw do

  resources :address

  get '/addresses/:town/:locality/:postcode/:street/:pao/:sao' => 'address#query'

end
