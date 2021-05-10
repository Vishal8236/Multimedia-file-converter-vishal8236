Rails.application.routes.draw do
  root 'user#index'
  devise_for :users
  resources :userimageupload, only: [:index, :new, :create]   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
