Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
