require "spec_helper"

describe UserDaysController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_days" }.should route_to(:controller => "user_days", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_days/new" }.should route_to(:controller => "user_days", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_days/1" }.should route_to(:controller => "user_days", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_days/1/edit" }.should route_to(:controller => "user_days", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_days" }.should route_to(:controller => "user_days", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_days/1" }.should route_to(:controller => "user_days", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_days/1" }.should route_to(:controller => "user_days", :action => "destroy", :id => "1")
    end

  end
end
