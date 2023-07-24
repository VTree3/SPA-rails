Rails.application.routes.draw do
  resources :images, except: [:index] do
    collection do
      post '', action: :index
    end
  end
  
  root "tasks#index"
  
  post "tasks/:id/toggle", to: "tasks#toggle"
  get "tasks/trying", to: "tasks#trying"
  get "tasks/login", to: "tasks#login"
  get "tasks/login/individual", to: "tasks#individual_login"
  get "tasks/login/company", to: "tasks#company_login"
  
  resources :tasks
end
