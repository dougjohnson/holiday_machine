class VacationsController < ApplicationController

  before_filter :authenticate_user!

  # GET /vacations
  # GET /vacations.xml
  def index
    @vacations        = Vacation.all # Need to restrict by the user that created them
    @vacation         = Vacation.new

#    TODO this will be whatever date we choose
    @today            = Date.today

    @holiday_statuses = HolidayStatus.all

    unless current_user.user_type == UserType.find_by_name("Manager")
      @holiday_statuses.reject! { |hs|
        hs.status != "Pending" and hs.status != "Cancelled"
      }
    end

    respond_to do |format|
      format.html
      format.json {
        holidays_json = Vacation.holidays_as_json params[:start], params[:end]
        render :json => holidays_json
      }
    end
  end

  # GET /vacations/1
  # GET /vacations/1.xml
  def show
    @vacation = Vacation.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @vacation }
    end
  end

#
#  # GET /vacations/new
#  # GET /vacations/new.xml
#  def new
#    @vacation = Vacation.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @vacation }
#    end
#  end

  # GET /vacations/1/edit
  def edit
    @vacation         = Vacation.find(params[:id])
    @holiday_statuses = HolidayStatus.all

    unless current_user.user_type != UserType.find_by_name("Manager")
      @holiday_statuses.reject! { |status| status.status != "Pending" }
    end

  end

  # POST /vacations
  # POST /vacations.xml
  def create
    @vacation = Vacation.new(params[:vacation])
    @vacation.user = current_user

    manager   = User.find_by_manager_id current_user.manager_id

    respond_to do |format|
      if @vacation.save
        #TODO commented out for now
#        HolidayMailer.holiday_request(current_user, manager, @vacation).deliver #TODO may be having some issues
        #TODO check the mailer was successful
        flash[:notice] = "Successfully created holiday."
        format.js
      else
        flash[:notice] = "Problem creating the holiday"
        format.js # { render 'fail_create.js.erb' }
      end
    end
  end

  # PUT /vacations/1
  # PUT /vacations/1.xml
  def update
    @vacation = Vacation.find(params[:id])
    @vacation.user = current_user

    respond_to do |format|
      if @vacation.update_attributes(params[:vacation])
        flash[:notice] = "Successfully changed your holiday."
        format.js
      else
        flash[:notice] = "Problem changing the holiday"
        format.js
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.xml
  def destroy

    @vacation = Vacation.find(params[:id])

    #TODO needs some logic around this, can't get rid of past holidays etc.
    #Destroy could cancel just change the status

    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to(vacations_url) }
      format.xml { head :ok }
    end
  end

  def get_details
    @vacation = Vacation.all
    y @vacation
  end

  private

  def days_in_month date_to_check
    days_in_month = (((date_to_check+1.month).at_beginning_of_month)-1.day).mday
    days_in_month
  end

end
