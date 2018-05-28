Rails.application.routes.draw do
  get 'cities/new'
  get 'cities/create'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'dashboards/index'
  get 'dashboards/show'
  get 'dashboard/index'
  get 'dashboard/show'
  get 'routes/index'
  get 'routes/show'
  get 'routes/new'
  get 'routes/create'
  get 'routes/edit'
  get 'routes/update'
  get 'routes/destroy'
  get 'routes/export'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
