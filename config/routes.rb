HolidayMachine::Application.routes.draw do

  get "user/manage_user"

#  get "calendar/index"

  resources :calendar

  resources :vacations

  resources :users

  devise_for :users, :admin

  resources :home, :only => :index
  resources :admins, :only => :index

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token

end
