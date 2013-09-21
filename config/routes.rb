AtomicJot::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  namespace :api do
    resources :products
  end

end