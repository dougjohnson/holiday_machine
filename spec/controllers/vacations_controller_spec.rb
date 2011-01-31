require 'spec_helper'

describe VacationsController do

  def mock_vacation(stubs={})
    (@mock_vacation ||= mock_model(Vacation).as_null_object).tap do |vacation|
      vacation.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all vacations as @vacations" do
      Vacation.stub(:all) { [mock_vacation] }
      get :index
      assigns(:vacations).should eq([mock_vacation])
    end
  end

  describe "GET index" do
    it "assigns the requested vacation as @vacation" do
      Vacation.stub(:find).with("37") { mock_vacation }
      get :show, :id => "37"
      assigns(:vacation).should be(mock_vacation)
    end
  end

  describe "GET new" do
    it "assigns a new vacation as @vacation" do
      Vacation.stub(:new) { mock_vacation }
      get :new
      assigns(:vacation).should be(mock_vacation)
    end
  end

  describe "GET edit" do
    it "assigns the requested vacation as @vacation" do
      Vacation.stub(:find).with("37") { mock_vacation }
      get :edit, :id => "37"
      assigns(:vacation).should be(mock_vacation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created vacation as @vacation" do
        Vacation.stub(:new).with({'these' => 'params'}) { mock_vacation(:save => true) }
        post :create, :vacation => {'these' => 'params'}
        assigns(:vacation).should be(mock_vacation)
      end

      it "redirects to the created vacation" do
        Vacation.stub(:new) { mock_vacation(:save => true) }
        post :create, :vacation => {}
        response.should redirect_to(vacation_url(mock_vacation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vacation as @vacation" do
        Vacation.stub(:new).with({'these' => 'params'}) { mock_vacation(:save => false) }
        post :create, :vacation => {'these' => 'params'}
        assigns(:vacation).should be(mock_vacation)
      end

      it "re-renders the 'new' template" do
        Vacation.stub(:new) { mock_vacation(:save => false) }
        post :create, :vacation => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested vacation" do
        Vacation.should_receive(:find).with("37") { mock_vacation }
        mock_vacation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vacation => {'these' => 'params'}
      end

      it "assigns the requested vacation as @vacation" do
        Vacation.stub(:find) { mock_vacation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:vacation).should be(mock_vacation)
      end

      it "redirects to the vacation" do
        Vacation.stub(:find) { mock_vacation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(vacation_url(mock_vacation))
      end
    end

    describe "with invalid params" do
      it "assigns the vacation as @vacation" do
        Vacation.stub(:find) { mock_vacation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:vacation).should be(mock_vacation)
      end

      it "re-renders the 'edit' template" do
        Vacation.stub(:find) { mock_vacation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested vacation" do
      Vacation.should_receive(:find).with("37") { mock_vacation }
      mock_vacation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vacations list" do
      Vacation.stub(:find) { mock_vacation }
      delete :destroy, :id => "1"
      response.should redirect_to(vacations_url)
    end
  end

end
