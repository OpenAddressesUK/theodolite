Rails.application.routes.draw do

  root to: 'addresses#index'

  resources :addresses
  resources :streets, only: [:show]
  resources :localities, only: [:show]
  resources :towns, only: [:show]
  resources :streets, only: [:show]
  resources :postcodes, only: [:show]

  get '/postcode/:postcode' => 'addresses#index'

end
