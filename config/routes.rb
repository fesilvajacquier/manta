Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ngos, only: %i[index show new create]
  resources :publications, only: %i[index show] do
    resources :offers, only: %i[create]
  end

  resources :offers, only: %i[index update] do
    resources :messages, only: %i[create]
  end

  resources :reports, only: %i[create]

  namespace :admin do
    resources :ngos, only: [:show] do
      resources :publications, only: %i[new create edit update destroy]
      resources :ngo_members, only: %i[create destroy]
    end
  end

  resources :pictures
end
