Rails.application.routes.draw do
  get 'time/index'

  get 'appointments/new', to: 'appointments#new'
  post 'appointments', to: 'appointments#create'
  get 'doctors/index'
  get '/home', to: 'static_pages#home'
  get  '/signup',  to: 'pacients#new'
  post '/pacients', to: 'pacients#create'
  get    '/login-pacient',   to: 'login#new_pacient'
  get    '/login-doctor',   to: 'login#new_doctor'
  post   '/login',   to: 'login#create'
  delete '/logout', to: 'login#destroy'
  get '/doctors', to: 'doctors#index'
  get '/time', to: 'time#index'
  get 'appointments/index', to: 'appointments#index'
  delete 'appointments/destroy', to: 'appointments#destroy'

  root 'login#new_pacient'

end
