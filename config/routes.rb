Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users
  get    '/help',        to: 'static_pages#help'

end
