class CalendarController < ApplicationController

  before_filter :authenticate_user!

  def show
    @vacations = Vacation.all

    #TODO this will be whatever date we choose
    @today = Date.today

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vacations }
    end
  end

end
