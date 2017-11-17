Rails.application.routes.draw do
	root 'sessions#new'
	
	# users
	resources :users
  get '/signup', to: 'users#new'

	# sessions
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
end
