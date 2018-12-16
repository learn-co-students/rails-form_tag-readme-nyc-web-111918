Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create]
  # post '/posts/', to: 'posts#create'
end
