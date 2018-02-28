Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  mount Blog::API, at: '/'

  mount GrapeSwaggerRails::Engine => '/swagger'
end
