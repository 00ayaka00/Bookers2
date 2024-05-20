Rails.application.routes.draw do
 
  
  root 'homes#top' 
  devise_for :users

  
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] 
  resources :users, only: [:show, :index, :edit, :update, :create] 
  
  get 'home/about', to: 'homes#about',as:'about' 
  post 'books' => 'books#create', as: 'update_book'
  post 'users' => 'users#create'
  post 'users/:id', to: 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
