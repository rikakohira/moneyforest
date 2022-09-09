Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'assettables', to: 'users/registrations#new_assettable'
    post 'create_assettable_and_debttable', to: 'users/registrations#create_assettable_and_debttable'
    get 'users/sign_up/complete', to: 'devise/registrations#create_debttable'
  end

  namespace :books do 
    resources :searches, only: :index, defaults: { format: :json }
  end

  resources :books

  resources :users, only: [:show, :edit, :update]

end
