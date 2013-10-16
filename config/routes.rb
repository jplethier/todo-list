TodoList::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :projects do
    member do
      get :add_task
    end

    resources :tasks, only: [:create, :update]
  end

end
