require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      visit root_path
      expect(page).to have_title("#{@base_title} | Home")
    end

    it "should have the content 'Home'" do
      visit root_path
      expect(page).to have_content('Home')
    end
    
    it "should have a non-black body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
  
  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
      visit contact_path
      expect(page).to have_title("#{@base_title} | Contact")
    end

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end
  end
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      visit about_path
      expect(page).to have_title("#{@base_title} | About")
    end

    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end
  end

    describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      visit help_path
      expect(page).to have_title("#{@base_title} | Help")
    end

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
  end
end
