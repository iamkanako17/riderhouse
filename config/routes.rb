Rails.application.routes.draw do
  devise_for :host_users
  root to: 'lodgings#index'
  resources :lodgings
end
