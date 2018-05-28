Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/adding_menu', to: 'pages#adding_menu'

  resources :medical_records
  resources :symptoms
  resources :appointments
  resources :prescriptions
  resources :calendar, only: [:index, :show]
end
