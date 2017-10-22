Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  get  '/login'  => 'sessions#new'
  post '/login'  => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  resource :user, only: [:show, :edit, :update]

  namespace :api do
    namespace :v1 do
      resource :users, only: :create
      resources :posts, only: [:index, :show, :create]
    end
  end
end
