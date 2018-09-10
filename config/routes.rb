Rails.application.routes.draw do

  root 'user#home'
  
  resources :teams
  resources :lists
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
