Rails.application.routes.draw do
  root 'users#index'
  devise_for :users

  resources :users do
    resources :products do
      resources :comments
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
