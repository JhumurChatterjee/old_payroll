Rails.application.routes.draw do
  get "home/index"
  resources "organizations"
  root "home#index"
  resources "password_sets", only: [:edit, :update]
end
