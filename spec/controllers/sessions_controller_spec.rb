require 'spec_helper'

describe SessionsController do
	render_views

  	describe "GET 'new'" do
    	it "should be successful" do
	      visit "/sessions/new"
	      response.should be_success
	    end

	    it "should have the right title" do
	      visit "/sessions/new"
	      expect(page).to have_title("Sign in")
	  	end

	  	it "should have a signup page at '/signup'" do
	      visit "/signin"
	      expect(page).to have_title("Sign in")
	    end
	end

	describe "POST 'create'" do

	 	describe "failure" do

	 		before(:each) do
	 			@attr = {email: "", password: "" } 
	 		end

			it "should re-render the new page" do
				post :create, session: @attr
				response.should render_template('new')
	 		end

	 		it "should have an error message" do
	 			post :create, session: @attr
	 			flash.now[:error].should =~ /invalid/i
	 		end
	 	end
	end
end

