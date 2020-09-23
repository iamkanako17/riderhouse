Rails.application.routes.draw do
  devise_for :host_users
  root to: 'lodgings#index'
  resources :lodgings do
    collection do
      get 'search'
    end
  end
end
