Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/v1" => "welcome#v1"

  resources :photos, except: :destroy do
    resources :requests, controller: "photo_requests", except: :destroy
    resources :notes, controller: "photo_notes", except: :destroy
    resources :askers, controller: "photo_askers", except: :destroy
  end 
  get "thanks" => "welcome#thanks"
  get "about" => "welcome#about"
  get "policy" => "welcome#policy"

  namespace :admin do
  	root "photos#index"
    resources :askers
    resources :photos do
      collection do
        post :bulk_update
      end
    end
  end


end
