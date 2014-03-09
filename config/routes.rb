Poetrybin::Application.routes.draw do
  resources :poems
  get 'random', to: 'poems#random'
  resource :session, only: [:new, :create, :destroy]
  root to: 'poems#random'
end
