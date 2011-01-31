require 'spec_helper'

describe "vacations/index.html.erbb" do
  before(:each) do
    @vacation = assign(:vacation, stub_model(Vacation,
      :description => "Description",
      :days_left => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
