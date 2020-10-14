Rails.application.routes.draw do
  resources :healths
  get 'sessions/new'

  resources :questions
  get 'home/top'

  get 'infection/top'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
