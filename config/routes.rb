Rails.application.routes.draw do
  get 'my_page', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root "home#index"
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: [:create, :destroy]
end
