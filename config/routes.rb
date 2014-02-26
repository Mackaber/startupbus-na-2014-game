DeviseApp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :omniauthable,
    path_names: { sign_in: "login", sign_out: "logout" },
    controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :conductors

  resources :buspreneurs do
    get :not_allowed
  end

  resources :investors do
    put :request_buspreneurship
  end

  resources :dashboard
  resources :teams
  resources :buses
  resources :milestones

  root to: "home#index"
end
