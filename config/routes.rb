Rails.application.routes.draw do

  # devise_for :admins, controllers: { registrations: 'registrations' }
  devise_for :admins, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
  }
  # , controllers: { registrations: 'registrations' }

  get 'table/index'
  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to:''

  resources :admins do
    resources :guests
  end

end
