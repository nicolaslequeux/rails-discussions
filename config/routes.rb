Rails.application.routes.draw do
  
  resources :discussions
  
  # root to: "home#index"
  root to: "discussions#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
end
