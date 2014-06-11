require 'spec_helper'

describe UsersController do
	render_views

  describe "GET 'show'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should be success" do
      get :show, id: @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, id: @user
      assigns(:user).should == @user
    end
  end

  describe "GET 'new'" do

    it "returns http success" do
      visit signup_path
      response.should be_success
    end

   	it "should have the right title" do
      visit signup_path
      expect(page).to have_title("Sign up")
    end

    it "should have a signup page at '/signup'" do
      visit '/signup'
      expect(page).to have_content("Sign up")
    end
  end

end
