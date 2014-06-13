Muenster::Application.routes.draw do
  resources :jobs
  resources :companies, except: :delete
end
