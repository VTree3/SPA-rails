Rails.application.routes.draw do
  root "tasks#index"
  post "tasks/:id/toggle", to: "tasks#toggle"
  get "tasks/trying", to: "tasks#trying"
  get "page2", to: "pages#body_2_index"
  get "tasks/login", to: "tasks#login"
  get "tasks/login/individual", to: "tasks#individual_login"
  get "tasks/login/company", to: "tasks#company_login"
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
