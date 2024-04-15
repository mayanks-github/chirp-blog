Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          post 'register', to: 'users#register'
        end

        member do
          put 'edit_email', to: 'users#edit_email'
          put 'edit_number', to: 'users#edit_number'
          put 'edit_password', to: 'users#edit_password'
        end
      end

      resources :blogs

      resources :sessions, only: [] do
        collection do
          post :login, to: 'sessions#create'
          delete :logout, to: 'sessions#destroy'
        end
      end
    end
  end
end
