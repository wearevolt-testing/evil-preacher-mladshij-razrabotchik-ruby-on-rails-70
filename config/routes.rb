Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resource :users, only: :create
      resources :posts, only: [:index, :show, :create]
    end
  end
end
