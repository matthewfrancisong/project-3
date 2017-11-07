Rails.application.routes.draw do
  devise_for :admins
  get 'table/index'

  root 'main#index'
  
  get 'main/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to:''
end
