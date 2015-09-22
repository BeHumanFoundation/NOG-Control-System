Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :lessons
  resources :responsibles
  resources :students
  resources :teachers
  resources :lessons
  resources :subjects

  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout',to: "logins#destroy"
end
