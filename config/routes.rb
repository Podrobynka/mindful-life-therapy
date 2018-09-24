Rails.application.routes.draw do
  resource :settings, only: [:show, :edit, :update]
  get '/about', to: 'home_page#show', as: 'about'
  get '/counselling-and-psychotherapy', to: 'home_page#show', as: 'counselling'
  get '/mindfulness', to: 'home_page#show', as: 'mindfulness'
  get '/contact', to: 'home_page#show', as: 'contact'
  root 'home_page#show'
end
