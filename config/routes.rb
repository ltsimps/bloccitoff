Blocitoff::Application.routes.draw do
  resources :lists 
  resources :items
  
  root :to => "lists#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end