Muenster::Application.routes.draw do
  resources :jobs, only: [:index, :show, :new, :create]
  resources :companies, except: :delete
end
