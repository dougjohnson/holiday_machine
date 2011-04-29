class AdministerController < ApplicationController

  before_filter :authenticate_user!

  #TODO restrict to managers only  via  / rename to something else

  def index
    #TODO restrict holidays by year
    @statuses = HolidayStatus.all
    @users = User.get_team_users(current_user.id).includes(:vacations)
    respond_to do |format|
       format.html
    end
  end

#  def create
#    @vacation = Vacation.find_by_id(params[:id])
#    @vacation.notes = params[:vacation_notes]
#    @vacation.holiday_status_id = params[:vacation_holiday_status_name]
#    @vacation.save
#    manager = User.find_by_id(@vacation.manager_id)
#    #TODO prevent holiday status being switched to pending
##    if vacation.holiday_status_id == 3
#      if manager
#        HolidayMailer.holiday_actioned(manager, @vacation).deliver
#      end
##    end
#    flash[:notice] = "Holiday status updated"
#    respond_to do |format|
#       format.js
#    end
#
#  end

end
