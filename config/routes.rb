Rails.application.routes.draw do

  resources :moves
  resources :pieces
  resources :game_boards do
    resources :plays
  end

  devise_for :users
  devise_for :admins

  namespace :admin do
    DashboardManifest.new.dashboards.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest.new.root_dashboard, action: :index
  end

  authenticate :admin do
    mount Resque::Server, at: '/resque'
  end

  mount SeaMule::Server, at: '/seamule'

end
