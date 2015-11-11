Rails.application.routes.draw do
  devise_for :users

  resources :reports, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end
  root to: 'reports#new'
end
