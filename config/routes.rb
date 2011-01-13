ActionController::Routing::Routes.draw do |map|

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :user_sessions
  map.resources :users
  map.resources :articles
  

  map.root :articles


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
