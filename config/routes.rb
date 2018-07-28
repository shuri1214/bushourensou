Rails.application.routes.draw do
	root to: 'search#index'
  get '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

	resources :bushous do
		member do
			get :keywords
		end
	end	
	resources :impressions, only: [ :create, :destroy  ]
	resources :search, only: [ :index ] do
		#collection do
			#get ':q', to: 'search#search'
			#post ':q', to: 'search#search'
		#end
	end
end
