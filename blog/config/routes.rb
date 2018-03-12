Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  mount Blog::API, at: '/'

  mount GrapeSwaggerRails::Engine => '/swagger'
end
