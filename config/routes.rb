Rails.application.routes.draw do
  
  resources :channels
  
  resources :discussions do

    # to nest replies inside discussions + right path  
    resources :replies
  
  end

  
  # root to: "home#index"
  root to: "discussions#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  
end
