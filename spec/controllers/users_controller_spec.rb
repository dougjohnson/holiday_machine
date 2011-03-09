require 'spec_helper'

describe UsersController do

  describe "GET 'manage_user'" do
    it "should be successful" do
      get 'manage_user'
      response.should be_success
    end
  end

end
