class UserSettingsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def update
    current_user.manager_id = params[:user][:manager_id]
    current_user.save!

    respond_to do |format|
      format.js
    end
  end

end
