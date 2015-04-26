Rails.application.routes.draw do
  resources :advertistment_packages, :only => [:create]
  resources :team_registrations, :only => [:create]
  resources :contacts, :only => [:create]
  resources :newsletters, :only => [:create]

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  HighVoltage.configure do |config|
    config.home_page = 'home'
  end


end
