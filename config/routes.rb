Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :matchs, only: [] do
    resources :messages, only: :create
    resources :conversations, only: :show
  end

  resources :pets, only: [:show, :index]

end
