Rails.application.routes.draw do
  resources :group_contacts do
  	get 'update_status'
  end
  resources :groups do
    get 'update_status'
    post 'add_contact_to_group'
    collection do
      get 'search_group'
      get 'search_group_contacts'
    end
  end
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*path', to: redirect('/'), via: :all
end
