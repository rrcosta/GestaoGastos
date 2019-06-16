Rails.application.routes.draw do
  resources :categories
  resources :expenses 

  resources :users, params: :_username

  # filtro de data
  get "gasto_por_dia", to: "expenses#filter_by_date", param: :data

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'  
end
