Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end


  get "dashboard/index"
  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard", to: "dashboard#index", as: :dashboard

  resources :users
  resources :articles

  get "home", controller: "home", action: "index", as: "home"
  # get "student", to: "student#index", as: "student"

  root "home#index"

end
