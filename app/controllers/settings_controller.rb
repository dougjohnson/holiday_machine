class SettingsController < ApplicationController
  # GET /settings
  # GET /settings.xml
  def index
    @settings = Setting.all
    @setting = Setting.new

#TODO save the years to the database as holiday years, so that hols and no_days can be linked with this in a join table
    #Set migration for the initial dates
    @year_start = (Date.today.at_beginning_of_year).strftime("%d/%m/%Y")
    @year_end = ((Date.today.at_beginning_of_year + 1.year) - 1.day).strftime("%d/%m/%Y")

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
    end
  end

  # GET /settings/1/edit
  def edit
    @setting = Setting.find(params[:id])
  end

  # POST /settings
  # POST /settings.xml
  def create
    @setting = Setting.new(params[:setting])

    respond_to do |format|
      if @setting.save
        format.html { redirect_to(@setting, :notice => 'Setting was successfully created.') }
        format.xml  { render :xml => @setting, :status => :created, :location => @setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /settings/1
  # PUT /settings/1.xml
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to(@setting, :notice => 'Setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.xml
  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to(settings_url) }
      format.xml  { head :ok }
    end
  end
end
