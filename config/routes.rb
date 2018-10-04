Rails.application.routes.draw do
  resource :about_page, only: [:show, :edit, :update], controller: 'about_page', path: 'about-mindful-life-therapy'
  resource :counselling_page, only: [:show, :edit, :update], controller: 'counselling_page', path: 'counselling-and-psychotherapy-in-glasgow'
  resource :mindfulness_page, only: [:show, :edit, :update], controller: 'mindfulness_page', path: 'mindfulness-in-glasgow'
  resource :settings, only: [:show, :edit, :update]

  get '/contact', to: 'contact#new', as: 'contact'
  post '/contact', to: 'contact#create', as: 'create_contact'

  root 'home_page#show'
end
