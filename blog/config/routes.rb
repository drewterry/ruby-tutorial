Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'welcome/index'

  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  mount Blog::API, at: '/'

  mount GrapeSwaggerRails::Engine => '/swagger'
end
