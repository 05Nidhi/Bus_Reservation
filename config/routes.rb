Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to:"homes#index"
  resources :registrations
  # post "/registrations/new" to: "registrations#index"

  post '/registrations/new', to: 'registrations#new'
  resources :logins
  # post '/logins/create', to: 'logins#create'
  post '/logins/new', to: 'logins#new'
  # post '/logins/login', to: 'logins#login'
  # post '/logins/new/create', to: 'logins#new#create'
  # post '/login/login', to: 'login#login'
  # resources :logins do
  #   collection do
  #     post :new
  #     post :create
  #   end
  # end
  resources :buses
  post '/buses/new', to: 'buses#new'
  get '/buses/list', to: 'buses#list'
  post '/tickets/new' , to: 'tickets#new'
  post '/tickets/create' , to:'tickets#create'
  post '/searches/new' , to:'searches#new'
  post '/searches/create' , to: 'searches#create'
  resources :searches
  resources :tickets

end
