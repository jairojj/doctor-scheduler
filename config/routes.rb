Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get  '/signup',  to: 'pacients#new'
  post '/pacients', to: 'pacients#create'
  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout', to: 'login#destroy'

  root 'login#new'
  #resources :pacients
  
end
