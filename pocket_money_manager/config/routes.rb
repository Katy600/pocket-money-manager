Rails.application.routes.draw do

  root 'login#index'
  get 'login/index'
  get 'login/login'
  post 'login/attempt_login'
  get 'login/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "parents#index"
  get 'parents' => 'parents#index'
  resources :parents

  get 'children' => 'children#index'
  resources :children
  
end
