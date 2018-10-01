Rails.application.routes.draw do
  resource :about_page, only: [:show, :edit, :update], controller: 'about_page', path: 'about'
  resource :settings, only: [:show, :edit, :update]

  # get '/about', to: 'about_page#show', as: 'about'
  # get '/counselling-and-psychotherapy', to: 'home_page#show', as: 'counselling'
  # get '/mindfulness', to: 'home_page#show', as: 'mindfulness'
  get '/contact', to: 'contact#new', as: 'contact'
  post '/contact', to: 'contact#create', as: 'create_contact'

  root 'home_page#show'
end
