Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events do
    resources :event_attendances, only: [:create]
  end

  resources :users
end
