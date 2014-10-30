Rails.application.routes.draw do
  get '/address/:town/:locality/:postcode/:street/:pao/:sao' => 'address#show'
end
