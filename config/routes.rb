Rails.application.routes.draw do
  get '/landmarks', to: 'landmark#index'
  resources :landmarks
end
