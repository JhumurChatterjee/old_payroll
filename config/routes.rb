Rails.application.routes.draw do
  get "home/index"
  resources "organizations"
  root "home#index"
end
