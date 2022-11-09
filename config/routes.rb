Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' }
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  # end
  root 'pages#home'
  resources :users, only: :show
end
