Rails.application.routes.draw do
  root to: 'top#index'
  resources :books do
    collection do 
      get 'search'
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'assettables', to: 'users/registrations#new_assettable'
    post 'create_assettable_and_debttable', to: 'users/registrations#create_assettable_and_debttable'
    get 'users/sign_up/complete', to: 'devise/registrations#create_debttable'
  end

end
