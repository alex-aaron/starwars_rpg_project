Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth"}
  resources :awards do 
    resources :comments, only: [ :index, :show, :new, :create, :edit, :update, :destroy]
  end
  delete '/awards/:award_id/comments/:id' => 'comment#destroy'
  resources :comments, only: [ :index, :show, :new, :create , :edit, :update, :destroy ]
  resources :movies
  resources :users, only: [ :index, :show, :new, :create, :update, :destroy]
  get '/users/:id/edit' => "users#edit"
  resources :sessions, only: [ :create ]
  get '/' => "static#home"
  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"
  delete '/awards/:id' => "awards#destroy"
  get '/awards/years/:slug' => "years#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
