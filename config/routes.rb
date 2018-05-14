# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

require 'sidekiq/web' if Rails.env.development?

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
end
