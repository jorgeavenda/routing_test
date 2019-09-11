Rails.application.routes.draw do
  resources :route, only: [:index] do
    collection do
      get :assign
      get :unassign
    end
  end

  root 'route#index'
end
