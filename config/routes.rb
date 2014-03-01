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
  resources :teams do
    resources :investments, only: [:create, :new]
  end

  resources :team_milestone_requests, only: [:create, :edit] do

  end



  resources :buses
  resources :milestones do
    resources :teams do
      resources :team_milestone_requests
    end
  end

  root to: "home#index"
end
