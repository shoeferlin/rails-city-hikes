Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    resources :reviews, only: [:create, :destroy]
  end
  resources :dashboards, only: [:index, :show]
  resources :cities, only: [:new, :create]
  resources :sights, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
