class UserDaysController < ApplicationController
  # GET /user_days
  # GET /user_days.xml
  def index
    @user_days = UserDay.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_days }
    end
  end

  # GET /user_days/1
  # GET /user_days/1.xml
  def show
    @user_day = UserDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_day }
    end
  end

  # GET /user_days/new
  # GET /user_days/new.xml
  def new
    @user_day = UserDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_day }
    end
  end

  # GET /user_days/1/edit
  def edit
    @user_day = UserDay.find(params[:id])
  end

  # POST /user_days
  # POST /user_days.xml
  def create
    @user_day = UserDay.new(params[:user_day])

    respond_to do |format|
      if @user_day.save
        format.html { redirect_to(@user_day, :notice => 'User day was successfully created.') }
        format.xml  { render :xml => @user_day, :status => :created, :location => @user_day }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_days/1
  # PUT /user_days/1.xml
  def update
    @user_day = UserDay.find(params[:id])

    respond_to do |format|
      if @user_day.update_attributes(params[:user_day])
        format.html { redirect_to(@user_day, :notice => 'User day was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_days/1
  # DELETE /user_days/1.xml
  def destroy
    @user_day = UserDay.find(params[:id])
    @user_day.destroy

    respond_to do |format|
      format.html { redirect_to(user_days_url) }
      format.xml  { head :ok }
    end
  end
end
