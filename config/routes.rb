Rails.application.routes.draw do
  root to: 'home#index'
  resources :frogs, :only => [:index]
  resources :tadpoles, :only => [:index]

  post '/tadpoles/:id/evolve' => 'tadpoles#evolve', as: 'evolve'

  resources :ponds do
    resources :frogs, :shallow => true do
      resources :tadpoles, :shallow => true
    end
  end
end
