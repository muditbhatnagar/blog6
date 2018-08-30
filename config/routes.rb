Rails.application.routes.draw do
  resources :friend_requests
  devise_for :user

	root 'homes#index'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :friendships
	resources :users
	resources :profiles
	resources :friends
	resources :requests
end
