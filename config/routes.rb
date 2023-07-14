Rails.application.routes.draw do
  root "entries#index"
  resources :users do 
    resources :entries, only: [:new, :create]
  end
end
