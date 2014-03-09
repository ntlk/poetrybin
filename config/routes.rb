Poetrybin::Application.routes.draw do
  resources :poems
  get 'random', to: 'poems#random'
  root to: 'poems#random'
end
