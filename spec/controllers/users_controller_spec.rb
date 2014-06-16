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

    it "should have the right title" do
      visit user_path(@user)
      expect(page).to have_title("#{@user.name}")
    end

    it "should have the user's name" do
      visit user_path(@user)
      expect(page).to have_selector('h1', text: @user.name)
    end

    it "should have a profile image" do
      visit user_path(@user)
      expect(page).to have_selector('h1>img', visible: "gravatar")
    end

    it "should have the right URL" do
      visit user_path(@user)
      expect(page).to have_selector('td>a', text: user_path(@user))
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

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = {name: "", email: "", password: "", password_confirmation: ""}
      end

      it "should render the 'new' page" do
        post :create, user: @attr
        expect(page).to render_template('new')
      end

      it "should not create a user" do
        lambda do
          post :create, user: @attr
        end.should_not change(User, :count)  
      end
    end

    describe "success" do

      before(:each) do
        @attr = {name: "New User", email: "user@example.com", password: "foobar", password_confirmation: "foobar"}
      end

      it "should create a user" do
        lambda do
          post :create, user: @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, user: @attr
        expect(page).to redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, user: @attr
        flash[:success].should =~ /welcome to the sample app/i
      end
    end
  end
end
