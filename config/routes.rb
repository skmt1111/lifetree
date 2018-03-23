Rails.application.routes.draw do


  resources :users, path: '/', only: [ :index, :show] do
    resources :trees, only: [ :new, :create, :edit, :update, :destroy], shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
