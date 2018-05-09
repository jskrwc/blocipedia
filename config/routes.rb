Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  # get 'welcome/index'
  # get 'welcome/about'


  get 'about' => 'welcome#about'


  root 'welcome#index'
end
