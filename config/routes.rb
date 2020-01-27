Rails.application.routes.draw do
  post 'search/index'
  root 'home#index'
  
  get '*home', to: 'home#index'
end
