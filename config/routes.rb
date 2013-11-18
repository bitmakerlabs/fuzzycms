Fuzzycms::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  get 'search' => 'articles#search', :as => 'search'

  resources :users
  resources :sessions
  resources :categories, :only => ["index", "create"]

  root 'articles#index'

  resources :articles do
    resources :comments
  end

end
