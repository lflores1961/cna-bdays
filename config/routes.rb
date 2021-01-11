# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :reconocimientos, except: :new
  get 'members/:member_id/reconocer' => 'reconocimientos#new', as: :reconocer 

  resources :licencias, except: :new
  get 'members/:member_id/licenciar' => 'licencias#new', as: :licenciar
  
  resources :members do
    collection { post :import }
  end
  root 'static_pages#home'
  resources :users
  get '/help',              to: 'static_pages#help'
  get '/login',             to: 'sessions#new'
  post '/login',            to: 'sessions#create'
  delete '/logout',         to: 'sessions#destroy'
  get '/mensaje/:tipo',     to: 'mensajes#edit', as: 'edit_mensaje'
  patch '/mensaje/:tipo',   to: 'mensajes#update'
end
