Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pets, only: [:show, :index]
  get "up" => "rails/health#show", as: :rails_health_check


end
