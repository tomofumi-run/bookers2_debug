Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'create/destroy'
  devise_for :users
  
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only:[:create,:destroy]
    resource :book_comments, only:[:create,:destroy]
  end
end