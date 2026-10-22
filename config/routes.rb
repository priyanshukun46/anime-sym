Rails.application.routes.draw do
  root "home#index"

  # Catalog & Discovery
  get "catalog", to: "animes#index", as: :catalog
  get "search_suggestions", to: "animes#search_suggestions", as: :search_suggestions

  resources :anime, controller: "animes", only: [:index, :show] do
    resources :episodes, only: [:show] do
      resources :comments, controller: "episode_comments", only: [:create]
    end
  end

  resources :genres, only: [:index, :show]
  resources :collections, only: [:index, :show]

  # Watchlist / My List
  get "watchlist", to: "watchlists#index", as: :watchlist
  post "watchlist/toggle", to: "watchlists#toggle", as: :toggle_watchlist

  # Authentication
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout
  get "signup", to: "registrations#new", as: :signup
  post "signup", to: "registrations#create"

  # Informational & Legal
  get "about", to: "pages#about", as: :about

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
