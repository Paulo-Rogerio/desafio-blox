Rails.application.routes.draw do
  resources :reservas
  devise_for :users
  resources :salas
  
  get 'home/index'
  root 'home#index'
end
