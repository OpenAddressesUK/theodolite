Rails.application.routes.draw do

  root to: 'addresses#index'

  resources :addresses

  get '/postcode/:postcode' => 'addresses#index'

end
