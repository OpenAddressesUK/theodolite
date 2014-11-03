Rails.application.routes.draw do

  resources :addresses

  get '/addresses/:town/:locality/:postcode/:street/:pao/:sao' => 'addresses#query'

  get '/postcode/:postcode' => 'addresses#query', defaults: {
                                town: '-',
                                locality: '-',
                                street: '-',
                                sao: '-',
                                pao: '-'}

end
