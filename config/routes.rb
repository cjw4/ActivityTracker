Rails.application.routes.draw do
	root 'static_pages#home'
		
	# users
  get '/signup', to: 'users#new'
	get '/profile', to: 'users#show'
	get '/editprofile', to: 'users#edit'
	resources :users do
		resources :activities
	end
	
	# activities
	resources :activities do
		resources :entries
	end

	# sessions
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	
end


