Myrottenpotatoes::Application.routes.draw do
  resources :articles
  resources :movies do
    resources :reviews
  end
  post '/movies/search_tmdb'
  root :to => 'movies#welcome'
  get 'auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  # post 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'
  get 'auth/facebook',:as => 'login_facebook'
  get 'auth/twitter',:as => 'login_twitter'
end