require "spec_helper"

describe VacationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/vacations" }.should route_to(:controller => "vacations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vacations/new" }.should route_to(:controller => "vacations", :action => "new")
    end

    it "recognizes and generates #index" do
      { :get => "/vacations/1" }.should route_to(:controller => "vacations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vacations/1/edit" }.should route_to(:controller => "vacations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vacations" }.should route_to(:controller => "vacations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/vacations/1" }.should route_to(:controller => "vacations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vacations/1" }.should route_to(:controller => "vacations", :action => "destroy", :id => "1")
    end

  end
end
