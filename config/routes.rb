Rails.application.routes.draw do
  
  get 'home/new' => 'home#new'
  post 'home' => 'home#create'
  get 'relationships/followings'
  get 'relationships/followers'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  resources :posts, only: [:create, :new, :edit, :update, :destroy]
  resources :users, only: :show
  resource :profile, only: %i[show edit update]
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
