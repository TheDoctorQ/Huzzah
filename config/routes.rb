Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/vendors" => "vendors#index"
  get "/vendors/:id" => "vendors#show"
  post "/vendors" => "vendors#create"
  patch "/vendors/:id" => "vendors#update"
  delete "/vendors/:id" => "vendors#destroy"

  get "/events" => "events#index"
  get "/events/:id" => "events#show"
  post "/events" => "events#create"
  patch "/events/:id" => "events#update"
  delete "/events/:id" => "events#destroy"
end
