Rails.application.routes.draw do
  get 'counsels/list_counsel_index'

  resources :counsels
  resources :counselings
  resources :healths

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  resources :questions
  resources :answers
  get 'home/top'

  get 'infection/top'
  get 'absences/index'


  resources :users

  root 'home#top' # トップページをhomeコントローラのindexアクションに設定
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
