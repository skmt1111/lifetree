Rails.application.routes.draw do

  get 'privacy/index', to: 'privacy#index', as: 'privacy'
  get 'terms/index', to: 'terms#index', as: 'terms'

  resources :users, path: '/', only: [ :index, :show] do
    resources :trees, only: [ :new, :create, :edit, :update, :destroy], shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
