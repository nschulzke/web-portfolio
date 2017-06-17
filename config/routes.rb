Rails.application.routes.draw do
  resources :posts
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
