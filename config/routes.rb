Rails.application.routes.draw do
  get 'search_repositries/list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'search_repositries#list', as: 'search_repositories'

end
