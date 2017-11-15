Rails.application.routes.draw do


  # devise_for :admins,
  devise_for :admins, controllers: { registrations: 'registrations' }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
  }

  get 'email/index'
  post '/email/index', to: 'email#create'
  root 'main#index'
  get 'onboarding/index', to: 'onboarding#index'
  put 'onboarding/index', to: 'onboarding#update'



  resources :admins
  resources :guests

  get '/tables', to: 'tables#index'
  patch '/tables', to: 'tables#update'
  post '/tables', to: 'tables#update'

  # for guests to reply on RSVP status
  resources :rsvps, except: [:destroy, :patch]

end
