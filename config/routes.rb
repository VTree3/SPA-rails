Rails.application.routes.draw do
  root "tasks#index"
  post "tasks/:id/toggle", to: "tasks#toggle"
  get "tasks/trying", to: "tasks#trying"
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
