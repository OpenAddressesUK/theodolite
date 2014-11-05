Rails.application.routes.draw do

  resources :addresses

  get '/postcode/:postcode' => 'addresses#index'

end
