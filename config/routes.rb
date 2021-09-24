Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#homepage', as: :homepage
  get '/dashboard', to: 'dashboard#dashboard', as: :dashboard
  get 'dashboard/classes', to: 'classes#classes', as: :classes
end
