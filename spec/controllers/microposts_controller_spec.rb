require 'spec_helper'

describe MicropostsController do
	render_views

	describe "access controll" do
		it "Should deny access to 'create'" do
			post :create
			response.should redirect_to(signin_path)
		end
	end
end