Rails.application.routes.draw do
  resources :happened_events
  resources :match_events
  resources :score_events
  resources :sports
  resources :relationships
  resources :matches
  resources :users

  post   '/login',   to: 'auth#create'
  delete '/logout',  to: 'auth#destroy'

  resources :users do
    member do
      get :following, :followers, :matches
    end
  end

end
