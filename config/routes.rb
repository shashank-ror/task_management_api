Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :tasks, only: [:create, :update, :destroy, :index, :show] do
      member do
        post 'assign'
        put 'progress'
      end
      collection do
        get 'overdue'
        get 'status/:status', action: :by_status
        get 'completed', action: :completed_by_date
        get 'statistics'
        get 'priority_queue'
      end
    end
    resources :users, only: [] do
      get 'tasks', action: :tasks
    end
  end
end
