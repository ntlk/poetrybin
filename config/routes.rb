Poetrybin::Application.routes.draw do
  resources :poems
  root to: 'poems#random'
end
