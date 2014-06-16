Fuzzycms::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  get 'search' => 'articles#search', :as => 'search'

  get 'tags/:tag', to: 'articles#index', as: :tag

  resources :users
  resources :sessions
  resources :categories, :only => ["index", "create"]

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  namespace :admin do
    resources :articles
  end
end
