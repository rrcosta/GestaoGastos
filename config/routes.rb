Rails.application.routes.draw do
  resources :outlays
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, params: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
