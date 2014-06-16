require 'spec_helper'

describe SessionsController do
	render_views

  	describe "GET 'new'" do
    	it "returns http success" do
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
end
