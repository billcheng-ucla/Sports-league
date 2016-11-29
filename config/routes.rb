Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"
  resources :users
  get "/leagues/new", to: "leagues#new", as: "new_league"
  resources :leagues
  resources :teams do
    get :get_events, on: :member
  end
  resources :games
  resources :events
  
  get "/logout",    to: "sessions#destroy"
  post '/login',		to: "sessions#create",	as: "login"
end
