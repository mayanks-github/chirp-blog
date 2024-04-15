Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          post 'register', to: 'users#register'
        end
      end
    end
  end
end
