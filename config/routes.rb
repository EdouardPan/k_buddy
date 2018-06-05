Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/todaytasks', to: "dashboard#today_tasks"
  resources :medical_records
  resources :symptoms
  resources :medical_professionals do
    resources :appointments, only: [:new, :create]
    resources :prescriptions, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create]
  resources :prescriptions, except: [:new, :create]
  resources :calendar, only: [:index, :show]
  resources :treatments, only: [:show, :update]
  resources :photos, only: [:destroy]

end
