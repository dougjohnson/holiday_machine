class UserSettingsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def update
    p params

    respond_to do |format|
      format.js {}
    end
  end

end
