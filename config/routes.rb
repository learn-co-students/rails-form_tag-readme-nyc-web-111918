Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create]

# get '/posts/index', to: 'posts#index'

end