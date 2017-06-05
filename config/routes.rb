Rails.application.routes.draw do
  resources :locations, only: [:index, :create]
  root to: 'locations#index'
end
