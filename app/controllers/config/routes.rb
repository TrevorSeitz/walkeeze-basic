Rails.application.routes.draw do
  resources :dogs, :users, :welcome, :sessions, :walks, :walkers

  resources :users do
    resources :dogs, :walks
  end

  resources :dogs do
    resources :walks
  end

  # root to: "photos#index"
resources :photos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  patch '/users/:id' => 'user#udpate', :as => :update_user
  get '/update_dogs' => 'walks#update', :as => :update_dogs
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/login' => 'sessions#new', :as => :login
  get '/auth/github/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'
  get 'dogs/:id/schedule' => 'dogs#schedule', :as => :schedule
  delete 'dogs/:id' => 'dogs#destroy', :as => :delete_dog
  post 'dogs/create'=> 'dogs#create', :as => :create_dog
  post 'walks/create'=> 'walks#create', :as => :create_walk
  delete 'walks/:id' => 'walks#destroy', :as => :delete_walk
  post 'dogs/:id' => 'dogs#update', :as => :update_dog
  post "users/create" => 'users#create', :as => :create_user
  get '/walks/:id/participants' => 'walks#participants', :as => :participants

  match '/login' => 'sessions#new', via: [:get, :post]
  match '/users/callback' => 'sessions#create', via: [:get, :post]
  match 'users/register', to: 'sessions#create', via: [:get, :post]
  match '/walkers/register', to: 'sessions#create', via: [:get, :post]
end
