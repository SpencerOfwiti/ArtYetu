Rails.application.routes.draw do

  namespace :admin do
    resource :dashboard, only: :index
    resources :events
    root to: 'dashboard#index'
    resources :artists
    resources :buyers
  end

  scope module: 'frontend' do
    root to: 'home#index'
    resources :home, only: :index
    resources :about, only: :index
    resources :blogs, only: :index
    resources :gallery
    resources :contact, only: :index
  end

  namespace :artist do
    resource :dashboard, only: :index
    resources :upload_art
    root to: 'dashboard#index'
  end

  # devise routes
  devise_for :admins, controllers: { confirmations: 'admin/admins/confirmations',
                                     passwords: 'admin/admins/password',
                                     registrations: 'admin/admins/registrations',
                                     sessions: 'admin/admins/sessions',
                                     unlocks: 'admin/admins/unlocks' }
end
