require 'sidekiq/web'

Rails.application.routes.draw do
  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end
end
