class CalendarController < ApplicationController

  before_filter :authenticate_user!

  def index
    #Populate the calendar
    respond_to do |format|
      format.json {
        #TODO what if the current user is a manager
        holidays_json = Vacation.team_holidays_as_json current_user, params[:start], params[:end]
        render :json => holidays_json
      }
    end
  end

  def show
    @vacations = Vacation.all

    #TODO this will be whatever date we choose
    @today = Date.today

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @vacations }
    end
  end

end
