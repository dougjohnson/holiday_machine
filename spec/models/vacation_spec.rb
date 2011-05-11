require 'spec_helper'

describe Vacation do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @vacation = Vacation.new
  end

  it "should raise error if holiday has passed unless pending"

  it "should ensure date from must be before date to" do
    pending
    @vacation.date_from = "2011-02-01"
    @vacation.date_to = "2011-02-01"
  end

end
