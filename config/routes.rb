Rails.application.routes.draw do
  root 'user#index'
  devise_for :users
  resources :userimageupload, only: [:index, :new, :create, :destroy]  
  resources :useraudioupload, only: [:index, :new, :create, :destroy]  
  get 'mediaFileUpload', to: 'user_operation#show_doc_upload_ops'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
