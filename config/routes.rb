Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:create, :edit, :update]
  resources :sites

  get 'signin' => 'sessions#new', as: :login
  delete 'logout' => 'sessions#destroy', as: :logout
  delete 'logout' => 'sessions#destroy', as: :signout

  mount YariiEditor::Engine => ''
  mount YariiCloudinary::Engine => '/yarii_cloudinary'
end
