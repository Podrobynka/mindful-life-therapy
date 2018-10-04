Rails.application.routes.draw do
  resource :about_page, only: [:show, :edit, :update], controller: 'about_page', path: 'about-mindful-life-therapy'
  resource :counselling_page, only: [:show, :edit, :update], controller: 'counselling_page', path: 'counselling-and-psychotherapy-in-glasgow'
  resource :mindfulness_page, only: [:show, :edit, :update], controller: 'mindfulness_page', path: 'mindfulness-in-glasgow'
  resource :settings, only: [:edit, :update]

  get '/contact-mindful-life-therapy', to: 'contact#new', as: 'contact'
  post '/contact-mindful-life-therapy', to: 'contact#create', as: 'create_contact'
  get '/admin', to: 'admin#show', as: 'admin'

  root 'home_page#show'
  get '*unmatched_route', to: 'application#raise_routing_error'
end
