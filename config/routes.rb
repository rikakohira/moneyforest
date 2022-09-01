Rails.application.routes.draw do
  root to: 'top#index'
  resources :books, only: :index

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'assettables', to: 'users/registrations#new_assettable'
    post 'create_assettable_and_debttable', to: 'users/registrations#create_assettable_and_debttable'
  end

end
