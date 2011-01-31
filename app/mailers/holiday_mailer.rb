class HolidayMailer < ActionMailer::Base

  def holiday_request(user, manager, holiday)
    @holiday = holiday
    @user = user
    @manager = manager
    @url  = "http://example.com/login"
    mail(:to      => @manager.email, :from => @user.email,
         :subject => "You have a holiday request awaiting")
  end

  #TODO add status for holidays of used - these cannot be changed!!

  #TODO look at CSS book for guide to styling the holidays table

#  def holiday_cancellation
#  end

#  def holiday_acceptance
#  end

end
