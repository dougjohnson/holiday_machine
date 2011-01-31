require 'spec_helper'

describe "vacations/show.html.erb" do
  before(:each) do
    assign(:vacations, [
      stub_model(Vacation,
        :description => "Description",
        :days_left => 1
      ),
      stub_model(Vacation,
        :description => "Description",
        :days_left => 1
      )
    ])
  end

  it "renders a list of vacations" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
