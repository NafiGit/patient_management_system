Rails.application.routes.draw do
  get "home/index"
  get "dashboards/receptionist"
  get "dashboards/doctor"
  get "patients/index"
  get "patients/show"
  get "patients/new"
  get "patients/create"
  get "patients/edit"
  get "patients/update"
  get "patients/destroy"
  get 'dashboards/receptionist'
  get 'dashboards/doctor'
  devise_for :users
  resources :patients
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
