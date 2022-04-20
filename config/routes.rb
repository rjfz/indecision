# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'home#homepage'

  namespace :admin do
      resources :users
      resources :answers
      resources :role_permissions
      resources :lobby_questions
      resources :user_subjects
      resources :subjects
      resources :anon_user_lobbies
      resources :roles
      resources :anon_users
      resources :years
      resources :lessons
      resources :courses
      resources :questions
      resources :lobbies
      resources :responses

      root to: "users#index"
    end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'home#homepage', as: :homepage
  get '/dashboard', to: 'dashboard#dashboard', as: :dashboard
  get '/about', to: 'about#about', as: :about

  resources :lessons do
    member do
      get :stats
    end
  end
  resources :courses do
    member do
      get :stats
    end
  end
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
      get :cohort
      get :individual
    end
  end
  resources :users
  resources :questions
  resources :answers
  resources :responses
  resources :lobby_questions, only: [:update, :show] do
    member do
      patch :finish
    end
  end
  resources :years
end
