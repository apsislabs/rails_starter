# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: "auth", skip: [:registrations, :sessions]

  devise_scope :user do
    get "/login", to: "devise/sessions#new", as: :new_user_session
    post "/login", to: "devise/sessions#create", as: :user_session
    delete "/logout", to: "devise/sessions#destroy", as: :destroy_user_session

    get "/signup", to: "devise/registrations#new", as: :new_user_registration
    post "/signup", to: "devise/registrations#create", as: :user_registration
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
  get "status", to: "status#index"

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
end
