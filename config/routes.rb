Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campers, only: %i[show index create]
  resources :activities, only: %i[index destroy]
  resources :signups, only: %i[create]
end
