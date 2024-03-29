Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Applicaiton Routes
  root 'pages#homepage'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'

  resources :users, except: [:new]

  resources :articles

end
