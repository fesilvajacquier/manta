Rails.application.routes.draw do
  root to: 'pages#home'
  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :logout
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ngos, only: %i[index show new create]
  resources :publications, only: %i[index show]
  get '/publications/:publication_id/create_offer', to: 'offers#create_offer', as: :create_offer

  resources :offers, only: %i[index show update] do
    resources :messages, only: %i[create]
  end

  resources :reports, only: %i[create]

  namespace :admin do
    resources :ngos, only: [:show] do
      resources :publications, only: %i[new create]
      resources :ngo_members, only: %i[new create]
    end

   resources :publications, only: %i[edit update destroy]
   resources :ngo_members, only: %i[destroy]
  end

  resources :pictures, only: %i[create destroy]
end
