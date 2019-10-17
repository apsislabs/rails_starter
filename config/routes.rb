# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

require 'sidekiq/web' if Rails.env.development?

Rails.application.routes.draw do
  namespace '_dev' do
    mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
    mount Sidekiq::Web, at: '/sidekiq' if Rails.env.development?
  end

  get '/status', to: 'status#index'
end
