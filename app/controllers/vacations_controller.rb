class VacationsController < ApplicationController

  before_filter :authenticate_user!

  # GET /vacations
  def index
    #Populates the calendar, so restricted by manager
    @vacations = Vacation.team_holidays current_user.manager_id
    @vacation = Vacation.new

    @holiday_statuses = HolidayStatus.pending_only

    @days_remaining = current_user.get_holiday_allowance.days_remaining

    respond_to do |format|
      format.html
      format.json {
        holidays_json = Vacation.holidays_as_json params[:start], params[:end]
        render :json => holidays_json
      }
    end
  end

  # GET /vacations/1
  def show
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json do |json|
      end
    end
  end


  # POST /vacations
  # POST /vacations.xml
  def create
    @vacation = Vacation.new(params[:vacation])
    @vacation.user = current_user
    @vacation.holiday_status_id = 1
    manager_id = current_user.manager_id
    @vacation.manager_id = manager_id # Add manager to all holidays
    manager = User.find_by_id(manager_id)

    respond_to do |format|
      if @vacation.save
        unless manager.nil?
          HolidayMailer.holiday_actioned(manager, @vacation).deliver
        end
        @days_remaining = current_user.get_holiday_allowance.days_remaining

        #TODO check the mailer was successful
        flash[:notice] = "Successfully created holiday."
        format.js
      else
        flash[:notice] = "Problem creating the holiday"
        format.js
      end
    end
  end


  # DELETE /vacations/1
  # DELETE /vacations/1.xml
  def destroy
    @vacation = Vacation.find(params[:id])

    manager = User.find_by_id(@vacation.manager_id)

    respond_to do |format|
      if @vacation.destroy
        unless manager.nil?
          HolidayMailer.holiday_cancellation(current_user, manager, @vacation).deliver
        end
        @days_remaining = current_user.get_holiday_allowance.days_remaining
        @row_id = params[:id]
        flash[:notice] = "Holiday deleted"
        @failed = false
        format.js
      else
        flash[:notice] = "Could not delete a holiday which has passed"
        @failed = true
        format.js
      end
    end
  end

end
