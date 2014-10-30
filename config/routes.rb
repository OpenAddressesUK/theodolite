Rails.application.routes.draw do
  get '/addresses/:town/:locality/:postcode/:street/:pao/:sao' => 'address#show'
end
