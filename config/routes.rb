Rails.application.routes.draw do
  resource :settings, only: [:show, :edit, :update]
  get '/about', to: 'home_page#show', as: 'about'
  get '/counselling-and-psychotherapy', to: 'home_page#show', as: 'counselling'
  get '/mindfulness', to: 'home_page#show', as: 'mindfulness'
  get '/contact', to: 'contact#new', as: 'contact'
  post '/contact', to: 'contact#create', as: 'create_contact'

  root 'home_page#show'
end
