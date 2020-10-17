Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :offers
  get '/profile', to: 'pages#profile'
  get '/profile/:id', to: 'pages#profile'
  resources :branch_offices
  resources :users_to_offers
  resources :partners
  root to: 'pages#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
