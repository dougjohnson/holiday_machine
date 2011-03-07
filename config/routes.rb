HolidayMachine::Application.routes.draw do

#  get "user/manage_user"
#  get "calendar/index"

  resources :calendar

  match 'vacations/holiday_json' => 'vacations#holiday_json'

  resources :vacations

  resources :user_days

  match 'administer/get_team_data' => 'administer#get_team_data'
  match 'administer/create' => 'administer#create'

  resources :administer

  devise_for :users, :admin

#  devise_scope :user do
#     get "sign_in", :to => "vacations"
#  end

  resources :home, :only => :index
  resources :admins, :only => :index

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token

end