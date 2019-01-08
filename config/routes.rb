Rails.application.routes.draw do
  get 'user_stocks/create'
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  resources :user_stocks, only: [:create]
end
