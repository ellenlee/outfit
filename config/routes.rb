Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/v1" => "welcome#v1"

  resources :photos do
    resources :requests, controller: "photo_requests"
    resources :askers, controller: "photo_askers"
  end 
  get "thanks" => "welcome#thanks"
  get "about" => "welcome#about"
  get "policy" => "welcome#policy"

  namespace :admin do
  	root "photos#index"
  	resources :photos
  end


end
