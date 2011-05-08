require "spec_helper"

describe User do

  before do
    @user = User.create :forename=>"Bob", :surname=>"Builder"
  end

  it "gives the correct fullname" do
    @user.full_name.should == @user.forename + " " + @user.surname
  end

end