require 'spec_helper'

describe UserSettingsController do

  describe "GET 'change_manager'" do
    it "should be successful" do
      get 'change_manager'
      response.should be_success
    end
  end

end
