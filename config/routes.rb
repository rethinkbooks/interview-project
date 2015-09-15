Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :passwords, :registrations, :confirmations, :unlocks], controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  unauthenticated do
    devise_scope :user do
      root 'devise/sessions#new', as: :root
    end
  end

  root 'search#index', as: :authenticated_root
end
