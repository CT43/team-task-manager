Rails.application.routes.draw do

  root 'users#home'
  get "/login", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  delete '/lists/:id', to: 'lists#destroy'

  get '/auth/facebook/callback' => 'sessions#loginbyfacebook'

  get "/lists/[:id]", to: 'lists#show'

  resources :users do
    resources :lists
    resources :teams
  end


  resources :teams
  resources :lists
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
