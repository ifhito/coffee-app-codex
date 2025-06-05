Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coffee_beans, only: [:index]
    end
  end
end
