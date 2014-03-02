DeviseApp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :omniauthable,
    path_names: { sign_in: "login", sign_out: "logout" },
    controllers: { omniauth_callbacks: "omniauth_callbacks" }

  #resources :conductors

  resources :buspreneurs, only: [:show, :edit]

  #resources :investors
  #  do
  #   put :request_buspreneurship
  # end

  #resources :dashboard
  resources :teams, except: [:destroy] do
    resources :investments, only: [:create, :new]
  end

  resources :team_milestone_requests, only: [:create, :new]
  resources :team_updates, only: [:create, :new]
  resources :buses, only: [:show]
#  resources :milestones

  root to: "teams#index"

  get 'leaderboard' => 'leaderboard#index'

end
