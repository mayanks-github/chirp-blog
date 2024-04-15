Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          post 'register', to: 'users#register'
        end
      end

      resources :blogs

      resources :session, only: [] do
        collection do
          post :login, to: 'session#create'
          delete :logout, to: 'session#destroy'
        end
      end
    end
  end
end
