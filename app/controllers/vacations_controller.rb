class VacationsController < ApplicationController

  before_filter :authenticate_user!

  # GET /vacations
  def index
    #Populates the calendar, so restricted by manager
    @vacations        = Vacation.team_holidays current_user.manager_id
    @vacation         = Vacation.new

    @holiday_statuses = HolidayStatus.pending_only
    
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
    @vacation      = Vacation.new(params[:vacation])
    @vacation.user = current_user
    manager_id = current_user.manager_id
    @vacation.manager_id = manager_id # Add manager to all holidays


    respond_to do |format|
      if @vacation.save
#        HolidayMailer.holiday_request(current_user, manager, @vacation).deliver
        #TODO check the mailer was successful
        flash[:notice] = "Successfully created holiday."
        format.js
      else
        flash[:notice] = "Problem creating the holiday"
        format.js
      end
    end
  end

  # PUT /vacations/1
  # PUT /vacations/1.xml
  def update
    @vacation      = Vacation.find(params[:id])
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

    #TODO needs some logic around this, can't get rid of past holidays etc. - in model
    #Destroy could cancel just change the status
    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to(vacations_url) }
      format.xml { head :ok }
    end
  end

  def holiday_json
    @vacations = Vacation.where ["user_id = ?", current_user.id]
    respond_to do |format|
      format.json do
        json_data = []
        @vacations.each do |vacation|
          hol_hash = {:id                          => vacation.id.to_s, :vacation_description=>vacation.description, :vacation_date_from=>vacation.date_from.strftime("%d/%m/%Y"),
                      :vacation_date_to            =>vacation.date_to.strftime("%d/%m/%Y"), :vacation_working_days_used => vacation.working_days_used.to_s,
                      :vacation_status_name        =>vacation.holiday_status.status, :vacation_holiday_status_id=>vacation.holiday_status_id.to_s,
                      :vacation_holiday_status_name=>vacation.holiday_status.status,
                      :vacation_notes => vacation.notes}
          json_data << hol_hash
        end
        render :json => {:page=> params[:page], :total => 1, :records =>@vacations.size, :rows => json_data}
      end
    end
  end

end
