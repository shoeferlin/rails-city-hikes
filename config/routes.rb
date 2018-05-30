Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :routes do
    resources :reviews, only: [:create, :destroy]
    get 'export', to: 'exports#show', as: :export
    post 'exports/send-route-email', to: 'exports#send_route_email', as: :send_route_email
    post 'exports/send-route-phone', to: 'exports#send_route_phone', as: :send_route_phone
    post 'exports/send-route-clipboard', to: 'exports#send_route_clipboard', as: :send_route_clipboard
    post 'exports/send-route-gmaps', to: 'exports#send_route_gmaps', as: :send_route_gmaps
    post 'exports/send-route-friend', to: 'exports#send_route_friend', as: :send_route_friend
  end
  resources :dashboards, only: [:index, :show]
  resources :cities, only: [:new, :create]
  resources :sights, only: [:new, :create]
  get 'sights/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
