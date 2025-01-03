Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "animals" => "animals#index", as: :animals
  get "animals/:id(/:option)" => "animals#index", as: :animal, constraints: ->(req) { req.headers["Turbo-Frame"].blank? }
  get "animals/:id(/:option)" => "animals#drawer", constraints: ->(req) { req.headers["Turbo-Frame"].present? }
  patch "animals/:id" => "animals#update"

  # Defines the root path route ("/")
  root "animals#index"
end
