Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/vendors" => "vendors#index"
  get "/vendors/:id" => "vendors#show"
  
  post "/vendors" => "vendors#create"
end
