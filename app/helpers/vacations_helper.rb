module VacationsHelper

=begin

  def show_calendar calendar_date

#    TODO to remove????

    @selected_date = calendar_date

    @start_date    = @selected_date.at_beginning_of_month
    @start_day     = @start_date.wday

    #Swaps sunday and monday as we display monday first
    if @start_day == 0
      @start_day = 7
    elsif @start_day == 7
      @start_day = 0
    end

    @days_in_month   = days_in_month @selected_date

    @month_num       = @selected_date.month

    @weeks_per_month = ((@days_in_month+@start_day-1).to_f/7).ceil

    @week = 1
    @day = 1
    @day_adjusted = @start_day

    html             = "<div id='month_view'><table class='calendar'>
  <caption>"+ @selected_date.strftime("%B %Y") +"</caption>
  <col class='weekday' span='5'>
  <col class='weekend' span='2'>
  <thead>
  <tr>
    <th>Mon</th>
    <th>Tue</th>
    <th>Wed</th>
    <th>Thu</th>
    <th>Fri</th>
    <th>Sat</th>
    <th>Sun</th>
  </tr>
  </thead>
  <tbody>"

    @weeks_per_month.times do
      html << "<tr>"
      7.times do
        html << "<td><div class='day'></div></td>"
        @day         +=1
        @day_adjusted+=1
      end
      @week+=1
    end
    html << "</tbody></table></div>"
    return html
  end

=end

  def create_holiday_row holiday
    html = "<tr id='#{holiday.id}'>"
    html << "<td>#{holiday.date_from.strftime("%d/%m/%Y")}</td>"
    html << "<td>#{holiday.date_to.strftime("%d/%m/%Y")}</td>"
    html << "<td>#{holiday.description}</td>"
    html << "<td>#{holiday.working_days_used}</td>"
    html << "<td>#{holiday.holiday_status.status}</td>"
    html << "<td><img src='/images/update.gif' alt='Update Holiday'/></td>"
    html << "</tr>"
    html
  end

  private

  def day_to_show
    day_show = ""
    if @week==1 then
      if @day>@start_day-1 then
        day_show = (@day-@start_day+1).to_s
      end
    else
      if @day_adjusted-@start_day+1<@days_in_month+@start_day
        day_show =(@day-@start_day+1).to_s
      end
    end
    day_show
  end

  def days_in_month date_to_check
    days_in_month = (((date_to_check+1.month).at_beginning_of_month)-1.day).mday
    days_in_month
  end


end
