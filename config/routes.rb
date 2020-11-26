Rails.application.routes.draw do
#new 
  get "/landmarks/new", to: "landmarks#new", as: "new_landmark_path"

#create 
post "/landmarks/create", to: "landmarks#create", as: "landmarks_path"
#index
  get "/landmarks", to: "landmark#index"

#edit
get "/landmarks/:id/edit", to: "landmarks#edit", as: "edit_landmark_path"

#show
get "/landmarks/:id", to: "landmarks#show", as: "landmark_path"

#update
patch "landmarks/:id", to: "landmarks#update"

#destroy 
delete "landmarks/:id", to: "landmarks#destroy", as: "destroy_landmark_path"

resources :landmarks
end
