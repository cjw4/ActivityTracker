Rails.application.routes.draw do
	root 'sessions#new'
	
	# users
	resources :users do
		resources :activities, only: [:create, :edit, :destroy]
	end
  get '/signup', to: 'users#new'

	# sessions
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

end


