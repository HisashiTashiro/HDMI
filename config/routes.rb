Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/combination/hashtag/:name' => 'combinations#hashtag'
  get '/combination/hashtag' => 'combinations#hashtag'
  get 'users/show/iine/:id', to: 'users#iine'
  resources :combinations do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  
 end
 resources :users, only: [:show, :iine]
 root 'combinations#index'
end
