Rails.application.routes.draw do
  root 'application#home'
  resources :players
  resources :users, only: [:index, :new, :show] do
    resources :teams, only: [:show, :index, :new]
  end
  resources :teams
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/search' => 'search#index', :as => 'search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
