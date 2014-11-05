Rails.application.routes.draw do

  resources :addresses

  get '/postcode/:postcode' => 'addresses#query', defaults: {
                                town: '-',
                                locality: '-',
                                street: '-',
                                sao: '-',
                                pao: '-'}

end
