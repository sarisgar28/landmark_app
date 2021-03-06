Rails.application.routes.draw do
# #new 
#   get "/landmarks/new", to: "landmarks#new", as: "new_landmarks"

# #create 
# post "/landmarks/create", to: "landmarks#create", as: "landmarks"
# #index
# get "/landmarks", to: "landmarks#index"

# #edit
# get "/landmarks/:id/edit", to: "landmarks#edit", as: "edit_landmark"

# #show
# get "/landmarks/:id", to: "landmarks#show", as: "landmark"

# #update
# patch "/landmarks/:id", to: "landmarks#update"

# #destroy 
# delete "/landmarks/:id", to: "landmarks#destroy", as: "destroy_landmark"

# longestname
get "/landmarks/longestname", to: "landmarks#longestname", as: "longestname"

resources :users, only: [:new, :create, :show]
resources :landmarks

 post  "/landmarks/search", to: "landmarks#search", as: "landmark_search"
resources :landmarks do 
  resources :reviews, only: [:new, :index, :show, :create,  :edit, :update, :destroy]
end 
resources :users do 
  resources :landmarks 
end 

get '/signup', to: 'sessions#signup', as: 'signup'
post '/signup', to: 'users#create'
get '/login', to: 'sessions#login', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#logout', as: 'logout'


#omniauth
get '/auth/google_oauth2/callback', to: 'sessions#google_login', as: 'auth_google_oauth2_callback'

root "application#home"
end
