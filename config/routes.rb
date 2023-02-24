Rails.application.routes.draw do
  resources :categories, except: [:show] do
    resources :tasks, only: [:new]
  end
  resources :tasks
  put "/tasks/:id/complete", to: "tasks#complete", as: "complete_task"
  devise_for :users, controllers: { sessions: 'users/sessions'  }
  get '/users', to: redirect('/users/sign_up') # fix on devise redirecting to /users on failed signup
  root "tasks#index"
end
