Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  get 'about',  to: 'welcome#about'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#distory'

  resources :categories, except: [:distory]

end
