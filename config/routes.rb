Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/v1" => "welcome#v1"

  resources :photos
	resources :askers
  # get "welcome#v1"

  namespace :admin do
  	root "photos#index"
  	resources :photos
  end


end
