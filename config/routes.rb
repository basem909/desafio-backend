Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns do
    collection do
      get 'find_last_completed_campaign'
      post 'list_campaigns_by_state'
      get 'total_campaigns_by_state'
    end
  end
end
