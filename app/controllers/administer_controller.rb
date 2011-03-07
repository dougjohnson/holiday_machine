class AdministerController < ApplicationController

  before_filter :authenticate_user!

  #TODO restrict to managers only   / rename to something else
  
  def index
#    @vacations = Vacation.where ["user_id = ?", current_user.id]
  end

  def create
    vacation = Vacation.find_by_id(params[:id])
    vacation.notes = params[:vacation_notes]
    vacation.holiday_status_id = params[:vacation_holiday_status_name]
    vacation.save
    #TODO what is the response to the grid??
    #TODO send email
    render :nothing =>true
  end

  def get_team_data
    vacations = Vacation.where("manager_id = ? and user_id != ?", current_user.id, current_user.id).includes(:user)
    #TODO move creation of this data to the model
    #TODO - restrict by current holiday year (in a default scope)
    respond_to do |format|
      format.json do
        json_data = []
        vacations.each do |vacation|
          hol_hash = {:id                          => vacation.id.to_s, :vacation_description=>vacation.description, :vacation_date_from=>vacation.date_from.strftime("%d/%m/%Y"),
                      :vacation_date_to            =>vacation.date_to.strftime("%d/%m/%Y"), :vacation_working_days_used => vacation.working_days_used.to_s,
                      :vacation_status_name        =>vacation.holiday_status.status, :vacation_holiday_status_id=>vacation.holiday_status_id.to_s,
                      :vacation_holiday_status_name=>vacation.holiday_status.status, :email=>vacation.user.email, :vacation_notes=>vacation.notes}
          json_data << hol_hash
        end
        render :json => {:page=> params[:page], :total => 1, :records =>vacations.size, :rows => json_data}
      end
    end
  end

end
