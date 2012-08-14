require 'spec_helper'

describe SharesController do

  include ControllerSpecHelper

  before(:each) do
    stub_app_setup
    stub_coop
    stub_login

    controller.stub(:authorize!).and_raise(CanCan::AccessDenied)
  end

  describe "GET edit_share_value" do
    before(:each) do
      controller.stub(:authorize!).with(:update, @organisation)
    end

    def get_edit_share_value
      get :edit_share_value
    end

    it "is successful" do
      get_edit_share_value
      response.should be_success
    end
  end

  describe "PUT update_share_value" do
    before(:each) do
      controller.stub(:authorize!).with(:update, @organisation)

      @organisation.stub(:share_value_in_pounds=)
      @organisation.stub(:save!)
    end

    def put_update_share_value
      put :update_share_value, 'organisation' => {'share_value_in_pounds' => '0.70'}
    end

    it "updates the share value" do
      @organisation.should_receive(:share_value_in_pounds=).with('0.70')
      @organisation.should_receive(:save!)
      put_update_share_value
    end

    it "redirects to the shares page" do
      put_update_share_value
      response.should redirect_to('/shares')
    end
  end

end
