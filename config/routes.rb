Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:new, :create]

  devise_for :users, controllers: {registrations: "registrations"}
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
