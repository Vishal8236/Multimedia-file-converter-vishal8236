Rails.application.routes.draw do
  root 'user#index'
  devise_for :users
  get 'view_profile', to: "user#view_profile"
  resources :userimageupload, only: [:index, :new, :create, :destroy, :download_store_img]  
  resources :useraudioupload, only: [:index, :new, :create, :destroy, :download_store_audio]  
  get 'download_image_url', to: "userimageupload#download_store_img"
  get 'download_audio_url', to: "useraudioupload#download_store_audio"

  get 'mediaFileUpload', to: 'user_operation#show_doc_upload_ops'
  get 'imageconverter', to: 'user_operation#imageconverter'

  get 'video-converter', to: 'videoconverter#index'
  post 'videouploadconversion', to: 'videoconverter#create'
  get 'downloadvideo', to: 'videoconverter#downloadfile'
  get 'deletefile', to: 'videoconverter#deletefile'

  get 'audio-converter', to: 'audioconverter#index'
  post 'audiouploadconversion', to: 'audioconverter#create'
  get 'downloadcovertaudio', to: 'audioconverter#downloadfile'

  get 'imagecompression', to: 'imagecompression#index'
  post 'uploadimagecomp', to: 'imagecompression#create'
  get 'downloadimagecompress', to: 'imagecompression#downloadfile'

  #for admin
  resources :admin_activity, only: [:destroy]
  get 'show-all-user', to: 'admin_activity#index'
  # delete 'delete_user/:id', to: 'admin_activity#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
