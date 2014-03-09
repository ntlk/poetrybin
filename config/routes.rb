Poetrybin::Application.routes.draw do
  resources :poems
  get 'random', to: 'poems#random'
  get 'admin_access', to: 'sessions#login'
  post 'admin_access', to: 'sessions#check_password'
  put 'logout', to: 'sessions#logout'
  root to: 'poems#random'
end
