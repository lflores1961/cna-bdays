Rails.application.routes.draw do

  resources :members
  root 'static_pages#home'
  resources :users
  get    '/help',        to: 'static_pages#help'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  delete  '/logout',      to: 'sessions#destroy'
end
