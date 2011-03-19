class CreateVacationHolidayYears < ActiveRecord::Migration
  def self.up
    add_column :holiday_years, :description, :string, :length=>50
    add_column :vacations, :holiday_year_id, :integer

    HolidayYear.create(:description => "Oct 2010 to Sept 2011", :date_start => "2010-10-01", :date_end=> "2011-09-30")
    HolidayYear.create(:description => "Oct 2011 to Sept 2012", :date_start => "2011-10-01", :date_end=> "2012-09-30")
  end

  def self.down
    remove_column :holiday_years, :description
    remove_column :vacations, :holiday_year_id
  end
end
