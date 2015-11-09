Rails.application.routes.draw do
  resources :reports, only: [:index, :show, :new, :create]
  devise_for :users
  root to: 'reports#new'
end
