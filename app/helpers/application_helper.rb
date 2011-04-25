module ApplicationHelper

  def show_errors_as_list errors
    error_list = "<ul type='square'>"
    errors.full_messages.each do |msg|
      error_list << "<li>#{msg}</li>"
    end
    error_list << "</ul>"
  end
end
