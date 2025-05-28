# Rails.application.routes.draw do
#   get 'recommendations/index'
#   get 'reading_records/new'
#   get 'reading_records/create'
#   get 'books/index'
#   get 'books/show'

#   # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

#   # get "/your_first_screen" => "pages#first"
  
# end

Rails.application.routes.draw do
  root "books#index"

  resources :books, only: [:index, :show]
  resources :reading_records, only: [:new, :create]
  get "recommendations", to: "recommendations#index"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/profile", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
