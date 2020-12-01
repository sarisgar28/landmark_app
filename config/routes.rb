Rails.application.routes.draw do
#new 
  get "/landmarks/new", to: "landmarks#new", as: "new_landmarks"

#create 
post "/landmarks/create", to: "landmarks#create", as: "landmarks"
#index
get "/landmarks", to: "landmarks#index"

#edit
get "/landmarks/:id/edit", to: "landmarks#edit", as: "edit_landmark"

#show
get "/landmarks/:id", to: "landmarks#show", as: "landmark"

#update
patch "landmarks/:id", to: "landmarks#update"

#destroy 
delete "landmarks/:id", to: "landmarks#destroy", as: "destroy_landmark"
resources :landmarks do 
resources :reviews 
end 
resources :users, only: [:new, :create, :show]

get '/signup', to: 'sessions#signup', as: 'signup'
get '/login', to: 'sessions#login', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#logout', as: 'logout'
end
