Rails.application.routes.draw do
  get 'doctors/index'

  get '/home', to: 'static_pages#home'
  get  '/signup',  to: 'pacients#new'
  post '/pacients', to: 'pacients#create'
  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout', to: 'login#destroy'
  get '/doctors', to: 'doctors#index'

  root 'login#new'
  #resources :pacients
  
end
