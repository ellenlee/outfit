Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, :skip => [:registrations], controllers: { sessions: 'admins/sessions' }

  resources :admins,
    only: [:edit, :update, :destroy],
    controller: 'admins/registrations',
    as: :user_registration do
      get 'cancel'
    end

  # as :admin do
  #   get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
  #   put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  # end
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
    resources :admins
    resources :askers
    resources :photos do
      collection do
        post :bulk_update
      end
    end
  end


end
