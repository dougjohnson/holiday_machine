require "spec_helper"

describe MakeMesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/make_mes" }.should route_to(:controller => "make_mes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/make_mes/new" }.should route_to(:controller => "make_mes", :action => "new")
    end

    it "recognizes and generates #index" do
      { :get => "/make_mes/1" }.should route_to(:controller => "make_mes", :action => "index", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/make_mes/1/edit" }.should route_to(:controller => "make_mes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/make_mes" }.should route_to(:controller => "make_mes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/make_mes/1" }.should route_to(:controller => "make_mes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/make_mes/1" }.should route_to(:controller => "make_mes", :action => "destroy", :id => "1")
    end

  end
end
