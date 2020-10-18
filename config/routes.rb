Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users


  resources :offers
  get '/profile', to: 'pages#profile'
  get '/profile/:id', to: 'pages#profile'
  resources :branch_offices
  resources :users_to_offers
  resources :partners



  authenticated :user do
    root to: "offers#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: 'pages#home'
  end


  resources :users do
    resources :offers
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
