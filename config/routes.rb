Rails.application.routes.draw do
  get '/landmarks', to: 'landmark#index'
end
