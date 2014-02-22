Blocitoff::Application.routes.draw do
  resources :lists do

     resources :items
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end