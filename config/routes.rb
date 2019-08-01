Rails.application.routes.draw do

  namespace :admin do
    resource :dashboard, only: :index
    root to: 'dashboard#index'
  end

  scope module: 'frontend' do
    resources :home, only: :index
    root to: 'home#index'
  end

  namespace :artist do
    resource :dashboard, only: :index
    root to: 'dashboard#index'
  end

  # devise routes
  devise_for :admins, controllers: { confirmations: 'admin/admins/confirmations',
                                     passwords: 'admin/admins/password',
                                     registrations: 'admin/admins/registrations',
                                     sessions: 'admin/admins/sessions',
                                     unlocks: 'admin/admins/unlocks' }
end
