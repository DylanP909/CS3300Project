Rails.application.routes.draw do
  devise_for :users
  resources :pet_sitters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pet_sitters#index"
end
