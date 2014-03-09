Poetrybin::Application.routes.draw do
  resources :poems
  get 'random', to: 'poems#random'
  get 'admin_access', to: 'authentication#login'
  post 'admin_access', to: 'authentication#check_password'
  put 'logout', to: 'authentication#logout'
  root to: 'poems#random'
end
