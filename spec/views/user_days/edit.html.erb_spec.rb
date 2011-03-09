require 'spec_helper'

describe "user_days/edit.html.erb" do
  before(:each) do
    @user_day = assign(:user_day, stub_model(UserDay))
  end

  it "renders the edit user_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_days_path(@user_day), :method => "post" do
    end
  end
end
