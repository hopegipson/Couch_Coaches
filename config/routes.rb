Rails.application.routes.draw do
  get '/search' => 'search#index', :as => 'search'
  resources :players, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
