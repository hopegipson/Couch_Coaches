Rails.application.routes.draw do
  get '/search' => 'search#index', :as => 'search'
  root 'application#home'
  resources :players, only: [:index, :show]
  resources :teams
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
