Rails.application.routes.draw do
  get "comments/create"
  get "comments/destroy"
  resources :boards
end
