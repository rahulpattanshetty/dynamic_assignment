Rails.application.routes.draw do
  
  post 'roles', to:"roles#create"
  resources :vehicles
  namespace :admin do
    get 'users/permissions/:id', to:"users#permissions", as: "user_permissions"
    resources :users
    
  end
  get 'home', to:"home#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
