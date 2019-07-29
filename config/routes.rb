Rails.application.routes.draw do
  devise_for :users
  root 'homes#home'
  get "/:id/accept", to: "appointments#accept"

  resources :appointments
  resources :courses do 
    resources :appointments
  end
  get "/join/:id" , to: "courses#jointutor"
  get "/users",to: "users#index"
  get "/users/:id",to: "users#show"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
