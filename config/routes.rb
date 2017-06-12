Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: %i(show destroy) do
    resources :messages, only: %i(index create)
  end
end
