CodeNewbie::Application.routes.draw do
  resources :sessions
  root 'pages#index'

  # login
  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"
  
  get '/resources' => "resources#index", as: "resources"

end