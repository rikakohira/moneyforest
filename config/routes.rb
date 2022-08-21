Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'assettables', to: 'users/registrations#new_assettable'
    post 'assettables', to: 'users/registrations#create_assettable'
  end

  root to: 'top#index'
end
