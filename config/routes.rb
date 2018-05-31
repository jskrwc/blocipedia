Rails.application.routes.draw do

  get 'users/downgrade'
  # get 'users/show'        #will use later
  # get 'downgrade/show'

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  # get 'welcome/index'
  # get 'welcome/about'


  get 'about' => 'welcome#about'


  root 'welcome#index'
end
