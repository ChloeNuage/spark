Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  get 'tobegin', to: 'forms#tobegin'
  get 'aboutyou', to: 'forms#aboutyou'
  patch 'aboutyou_update', to: 'forms#aboutyou_update'
  get 'welldone', to: 'forms#welldone'
  get 'daily', to: 'forms#daily'
  patch 'daily_update', to: 'forms#daily_update'
  get 'almostdone', to: 'forms#almostdone'
  get 'adoptionproject', to: 'forms#adoptionproject'
  patch 'adoptionproject_update', to: 'forms#adoptionproject_update'
  
  resources :matchs, only: [] do
    resources :messages, only: :create
    resources :conversations, only: :show
  end

  resources :pets, only: [:show, :index]
end
