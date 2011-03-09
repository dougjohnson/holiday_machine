require 'spec_helper'

describe "user_days/new.html.erb" do
  before(:each) do
    assign(:user_day, stub_model(UserDay).as_new_record)
  end

  it "renders new user_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_days_path, :method => "post" do
    end
  end
end
