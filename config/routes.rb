Rails.application.routes.draw do

  get 'users/downgrade'


  devise_for :users

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create]

  # get 'welcome/index'
  # get 'welcome/about'


  get 'about' => 'welcome#about'


  root 'welcome#index'
end
