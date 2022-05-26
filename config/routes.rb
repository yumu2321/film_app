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
  
  scope '(:locale)' do
    resources :books
    resources :users, except: :create do
      member do
        get :followings, :followers
      end
    end
    resource :user_avatars, only: :destroy
    resources :relationships, only: %I[create destroy] # 追記
  end
  
end
