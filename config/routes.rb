CodeNewbie::Application.routes.draw do
  resources :sessions
  root 'pages#index'

  # login
  get '/login'  => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  
  get '/resources'           => 'resources#index', as: 'resources'
  get '/resources/edit'      => 'resources#edit',  as: 'edit_resources'
  get '/resources/:id'       => 'resources#show',  as: 'resource'
  patch '/resources/:id'     => 'resources#update'
  get '/resources/tags/:tag' => 'resources#index', as: 'tag'

  get '/careers'           => 'jobs#index', as: 'jobs'
  get '/careers/edit'      => 'jobs#edit',  as: 'edit_jobs'
  get '/careers/:id'       => 'jobs#show',  as: 'job'
  patch '/careers/:id'     => 'jobs#update'
  get '/careers/tags/:tag' => 'jobs#index', as: 'job_tag'


end