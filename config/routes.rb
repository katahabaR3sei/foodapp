Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#top"

  resources :users
  resources :shops
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'
end
