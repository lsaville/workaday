Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/google_oauth2', as: :google_login
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
end
