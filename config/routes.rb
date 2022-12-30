Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :registrations
  # post "/registrations/new" to: "registrations#index"

  # post '/registrations/new', to: 'registrations#new'
  resources :logins
  # post '/login/create', to: 'login#create'
  post '/logins/new', to: 'login#new'
  # post '/logins/new/create', to: 'login#new#create'
  # post '/login/login', to: 'login#login'



end
