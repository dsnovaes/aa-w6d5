Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cats#index"

  resources :cats, except: [:destroy] 

  get '/delete/:id', to: 'cats#destroy', as: 'delete_cat'
  
end
