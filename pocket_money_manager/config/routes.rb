Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "parents#index"
  get 'parents' => 'parents#index'
  resources :parents
end
