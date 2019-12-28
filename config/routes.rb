Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index]

      resources :twitter_users, only: [:index]
      get "twitter_users/:id/tweets", to: "twitter_users#show_tweets"

      resources :users, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
