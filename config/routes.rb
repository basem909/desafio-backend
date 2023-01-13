Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns do
    collection do
      get 'last_completed'
      post 'list_state'
      get 'total_state'
    end
  end
end
