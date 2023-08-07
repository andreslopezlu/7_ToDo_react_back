Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'api/v1/login',
    sign_out: 'api/v1/logout',
    registration: 'api/v1/signup'
  },
  controllers: {
    sessions: 'users/api/v1/sessions',
    registrations: 'users/api/v1/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :todo_lists, only: %i[index create destroy] do
        resources :items, only: %i[index create destroy]
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
