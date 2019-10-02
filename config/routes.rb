Rails.application.routes.draw do
  resources :pets, only: [:new, :create, :index]
  resources :contacts, only: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
