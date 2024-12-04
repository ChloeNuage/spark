Rails.application.routes.draw do
  get 'conversations/show'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  get 'welcome', to: 'forms#welcome'
  get 'intro1', to: 'forms#intro1'
  get 'intro2', to: 'forms#intro2'
  get 'intro3', to: 'forms#intro3'
  get 'tobegin', to: 'forms#tobegin'
  get 'aboutyou', to: 'forms#aboutyou'
  patch 'aboutyou_update', to: 'forms#aboutyou_update'
  get 'welldone', to: 'forms#welldone'
  get 'daily', to: 'forms#daily'
  patch 'daily_update', to: 'forms#daily_update'
  get 'almostdone', to: 'forms#almostdone'
  get 'adoptionproject', to: 'forms#adoptionproject'
  patch 'adoptionproject_update', to: 'forms#adoptionproject_update'
  get 'results', to: 'forms#results'
  patch 'results_update', to: 'forms#results_update'

  resources :matchs, only: [:show, :index, :create] do

    collection do
      get 'click_message', to: 'matchs#click_message'
    end
    resources :conversations, only: [:create, :show] do
      resources :messages, only: :create
    end
   resources :appointments, only: [:index, :new, :create, :destroy]
  end

  resources :pets, only: [:show, :index]

  resources :users, only: [:show]


  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
