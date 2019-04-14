Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'static_pages/home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/select', to: 'animals#select'




  resources :users
  resources :animals, only: [:create, :destroy, :show]
  resources :animal_foods, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #root 'application#hello'
  #root 'users#index'
  root 'static_pages#home'
end
