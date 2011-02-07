class ApplicationController < ActionController::Base
  protect_from_forgery

  #Devise override for home path
  def after_sign_in_path_for(resource)
    vacations_path
  end

end
