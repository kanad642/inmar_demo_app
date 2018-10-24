Rails.application.routes.draw do
  resources :contacts
  resources :group_contacts
  resources :groups do
    get 'update_status'
    post 'add_contact_to_group'
  end
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
