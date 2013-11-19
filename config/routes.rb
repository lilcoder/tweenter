Tweenter::Application.routes.draw do

   
	get "/login" => "sessions#new"
	post "/login" => "sessions#create"

	get "/logout" => 'sessions#destroy'

  resources :users do
    resources :tweents
    resources :follows
  end

  root to: "sessions#new"
  
end
