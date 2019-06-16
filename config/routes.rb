Rails.application.routes.draw do
  resources :expenses do
    get  'categoria',   to: 'categories#index'
    post 'categoria',   to: 'categories#create'
  end

  resources :categories

  # filtro de data
  get 'gasto_por_dia', to: 'expenses#filter_by_date', param: :data
  
  resources :users, params: :_username

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'  
end
