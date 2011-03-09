require 'spec_helper'

describe "user_days/show.html.erb" do
  before(:each) do
    @user_day = assign(:user_day, stub_model(UserDay))
  end

  it "renders attributes in <p>" do
    render
  end
end
