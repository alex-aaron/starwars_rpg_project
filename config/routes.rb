Rails.application.routes.draw do
  resources :awards
  resources :movies
  resources :users, only: [ :index, :show, :new, :create, :update ]
  resources :sessions, only: [ :create ]
  get '/' => "static#home"
  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
