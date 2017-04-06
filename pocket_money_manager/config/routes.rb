Rails.application.routes.draw do
  get 'login/login'
  post 'login/attempt_login'
  get 'login/log_out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "parents#index"
  get 'parents' => 'parents#index'
  resources :parents
end
