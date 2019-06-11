Rails.application.routes.draw do
  resources :expenses
  resources :users, params: :_username

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
