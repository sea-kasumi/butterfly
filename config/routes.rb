Rails.application.routes.draw do
  resources :answers
  resources :counsels
  resources :healths
  get 'sessions/new'
  post 'sessions/create'

  resources :questions
  get 'home/top'

  get 'infection/top'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
