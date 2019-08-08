  Rails.application.routes.draw do

	get 'registration/new'
	root 'login#login', as: 'home'
	#root 'registration#new', as: 'home'

  get 'login/login' #route for home page link and login link

  get '/login', to: 'users#new_login'
	
	get '/signup', to: 'registration#new'

  get '/search',     to: 'searches#new', as: 'search'
  get '/bookmark',     to: 'bookmark#index', as: 'bookmark' #displays all bookmarks for a given user
  get '/search',     to: 'searches#new'

  get '/resetpass',    to: 'reset_password#new'

  get '/bookmark', to: 'bookmark#destroy'


  # recloned, testing origin master


  resources :searches
  resources :bookmark
  resources :results
  resources :users
  resources :registration
  resources :login
  resources :reset_password
  


match    ':controller(/:action(/:id))',    :via    =>    :get
match    ':controller(/:action(/:id))',    :via    =>    :post

 #just a comment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
