Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :book_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
  	resource :book_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  root :to => "home#top"

  get "home/about" => "home#about"

end
