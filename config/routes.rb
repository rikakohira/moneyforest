Rails.application.routes.draw do

  root to: 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'assettables', to: 'users/registrations#new_assettable'
    post 'assettables', to: 'users/registrations#create_assettable'
    get 'debttables', to: 'users/registrations#new_debttable'
    post 'debttables', to: 'users/registrations#create_debttable'
  end

end
