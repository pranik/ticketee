Ticketee::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  get '/awaiting_confirmation', :to => "users#confirmation", :as => 'confirm_user'
  namespace :admin do
    root :to => "base#index"
    resources :users
  end
  resources :projects do
    resources :tickets
  end
  root :to => "projects#index"
end
