Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/failure'

  resources :friend_requests
  devise_for :user

	root 'homes#index'
	root 'conversations#index'
	resources :conversations, only: [:index, :show]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :friendships
	resources :users, only: [:index]
	resources :profiles
	resources :friends
	resources :requests
	resources :personal_messages

	get 'homes/index'
	#get '/auth/:provider/callback', :to => 'sessions#facebook',  via: [:get, :post]
	match 'auth/:provider/callback', to: 'sessions#create',  via: [:get, :post]
	match '/auth/failure', :to => 'sessions#failure',  via: [:get, :post]
	
	
end
