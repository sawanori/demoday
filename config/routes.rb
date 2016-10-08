Rails.application.routes.draw do




  get 'accounts/show'

  get 'accounts/edit'

  get 'relationships/create'

  get 'relationships/destroy'

  devise_for :users, controllers: {
    confirmations: 'confirmations',
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'home#index'
  resources :users, only:[:index]
  resources :spots
  resources :relationships, only:[:create, :destroy]
  resources :account, only: [:show, :edit, :update]
  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
end
