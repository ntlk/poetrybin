Poetrybin::Application.routes.draw do
  resources :poems do
    member do
      put 'hide'
    end
  end
  get 'random', to: 'poems#random'
  get 'about', to: 'pages#about'
  resource :session, only: [:new, :create, :destroy]
  root to: 'poems#random'
end
