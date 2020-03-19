Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books

  resources :post_images, only: [:new, :create, :index, :show]

  resources :users, only: [:show]

  root :to => "books#top"

end
