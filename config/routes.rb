Rails.application.routes.draw do
  resources :awards
  resources :movies
  resources :users, only: [ :index, :show, :new, :create, :update ]
  get '/' => "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
