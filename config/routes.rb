Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'
    resources :users
    get 'block_user', to: 'users#block_user'
    get 'activate_user', to: 'users#activate_user'
  end

  root to: 'home#home'
end
