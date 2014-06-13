Muenster::Application.routes.draw do
  resources :jobs, except: :delete
  resources :companies, except: :delete
end
