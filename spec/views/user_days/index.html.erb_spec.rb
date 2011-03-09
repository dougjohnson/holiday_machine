require 'spec_helper'

describe "user_days/index.html.erb" do
  before(:each) do
    assign(:user_days, [
      stub_model(UserDay),
      stub_model(UserDay)
    ])
  end

  it "renders a list of user_days" do
    render
  end
end
