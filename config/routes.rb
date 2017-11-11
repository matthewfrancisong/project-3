Rails.application.routes.draw do

  # devise_for :admins, controllers: { registrations: 'registrations' }
  devise_for :admins, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
  }
  # , controllers: { registrations: 'registrations' }

  get 'email/index'
  post '/email/index', to: 'email#create'
  root 'main#index'


  resources :admins
  resources :guests

  get '/tables', to: 'tables#index'
  patch '/tables', to: 'tables#update'
  post '/tables', to: 'tables#index'


end
