Rails.application.routes.draw do

  root 'users#home'
  get "/login", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  delete '/lists/:id', to: 'lists#destroy'

  get '/auth/facebook/callback' => 'sessions#loginbyfacebook'

  resources :users do
    resources :lists
    resources :teams
  end

  resources :teams
  resources :lists
  resources :tasks
  resources :users

  get "/users/:id/tasks_to_complete", to: 'tasks#tasks_to_complete'
end
