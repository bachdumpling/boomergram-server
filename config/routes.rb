Rails.application.routes.draw do
  
  resources :messages
  resources :likes
  resources :comments
  resources :relationships
  resources :posts
  resources :users
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #User Route
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/me', to: 'users#show_me'
  
  get '/feed', to: 'users#feed'

  delete '/unlike/:id', to: 'likes#unlike'
  
  #Relationship Route
  delete '/unfollow/:id', to: 'relationships#unfollow'
  post '/follow', to: 'relationships#create'
  get '/followers/:id', to: 'relationships#followers' # Get followers
  get '/following/:id', to: 'relationships#following' # Get followers'
end
