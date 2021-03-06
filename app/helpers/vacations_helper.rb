module VacationsHelper

  def create_holiday_row holiday
    html = "<tr id='#{holiday.id}'>"
    html << "<td class='ui-widget-content'>#{holiday.description}</td>"
    html << "<td class='ui-widget-content'>#{holiday.date_from.strftime("%d/%m/%Y")}</td>"
    html << "<td class='ui-widget-content'>#{holiday.date_to.strftime("%d/%m/%Y")}</td>"
    html << "<td class='ui-widget-content'>#{holiday.working_days_used}</td>"
    html << "<td class='ui-widget-content'>#{holiday.holiday_status.status}</td>"
    html << "<td class='ui-widget-content'>"
    html << "<button class='deleteButton' id='vacation#{holiday.id} %>'></button>"
    html << "</td>"
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
