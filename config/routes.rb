Rails.application.routes.draw do
  resources :service_entries
  resources :employees
  patch 'roles/update_permissions', to:"roles#update_permissions", as: "update_permissions"
  get 'roles/permissions/:id', to:"roles#permissions", as: "role_permissions"
  resources :roles
  # get "roles", to:"roles#index"
  # post 'roles', to:"roles#create"
  # delete 'roles/:id', to:"roles#destroy" 
  resources :vehicles
  namespace :admin do
    get 'users/assign_role/:id', to:"users#assign_role", as:"assign_role"
    
    resources :users
    
  end
  get 'home', to:"home#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
