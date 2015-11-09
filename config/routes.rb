Rails.application.routes.draw do
  resources :reports
  devise_for :users
  root to: 'reports#index'
end
