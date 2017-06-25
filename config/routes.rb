Rails.application.routes.draw do
  get 'message/create'

  get 'home/index'

  post 'message/read'
  
  devise_for :users
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
