Rails.application.routes.draw do
  resources :sessions
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  mount YariiEditor::Engine => "/yarii"
  mount YariiCloudinary::Engine => "/yarii_cloudinary"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
