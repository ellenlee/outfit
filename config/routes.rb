Rails.application.routes.draw do
  # devise_for :users
  devise_for :admins, :skip => [:registrations], controllers: { sessions: 'admins/sessions' }

 as :admin do
  get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
  put 'admins' => 'admins/registrations#update', :as => 'admin_registration'
end

  # as :admin do
  #   get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
  #   put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :askers, only: [:new, :create] do
    resources :photos, only: [:new, :create, :show]
  end

  resources :photos, only: [:new, :create, :show] do
    resources :requests, only: [:create], controller: "photo_requests", except: :destroy
    resources :notes, controller: "photo_notes", except: :destroy
    resources :askers, only: [:new, :create],  controller: "photo_askers", except: :destroy
  end
  get "thanks" => "welcome#thanks"
  get "about" => "welcome#about"
  get "policy" => "welcome#policy"

  namespace :admin do
  	root "photos#index"
    resources :admins, only: [:index, :create, :destroy]
    resources :askers do
      post :bulk_update, on: :collection
    end
    resources :photos do
      collection do
        post :bulk_update
      end
    end
  end


end
