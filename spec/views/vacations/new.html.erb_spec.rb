require 'spec_helper'

describe "vacations/new.html.erb" do
  before(:each) do
    assign(:vacation, stub_model(Vacation,
      :description => "MyString",
      :days_left => 1
    ).as_new_record)
  end

  it "renders new vacation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => vacations_path, :method => "post" do
      assert_select "input#vacation_description", :name => "vacation[description]"
      assert_select "input#vacation_days_left", :name => "vacation[days_left]"
    end
  end
end
