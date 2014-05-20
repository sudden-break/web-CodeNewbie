CodeNewbie::Application.routes.draw do
  resources :sessions
  root 'pages#index'
    # login
  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"

end