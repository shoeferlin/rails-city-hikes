Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    resources :reviews, only: [:create, :destroy]
    resources :sights, only: [:destroy, :create]
  end
  resources :dashboards, only: [:index, :show]
  resources :cities, only: [:new, :create]
  # get 'sights/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
