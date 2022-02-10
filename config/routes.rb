# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#homepage', as: :homepage
  get '/dashboard', to: 'dashboard#dashboard', as: :dashboard
  get '/about', to: 'about#about', as: :about

  resources :lessons
  resources :courses
  resources :subjects
  resources :public_lobbies do
    collection do
      post :room_code
    end
  end
  resources :lobbies do
    member do
      get :stats
      get :room_information
      get :leaderboard
    end
  end
  resources :users
  resources :questions
  resources :answers
  resources :responses
  resources :lobby_questions, only: [:update, :show]
  resources :years
end
