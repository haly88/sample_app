require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "returns http success" do
      visit root_path
      response.should be_success
    end

    it "should have the right title and links" do
      visit root_path
      expect(page).to have_title("#{@base_title} | Home")
      click_link "About"
      expect(page).to have_title('About')
      click_link "Contact"
      expect(page).to have_title('Contact')
      click_link "Home"
      expect(page).to have_title('Home')
      click_link "Sign up now!"
      expect(page).to have_title('Sign up')
      expect(page).to have_selector('a[href="/"]>img')
    end

    it "should have a Home page at '/'" do
      visit '/'
      expect(page).to have_content('Home')
    end
    
    it "should have a non-black body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
  
  describe "GET 'contact'" do
    it "returns http success" do
      visit contact_path
      response.should be_success
    end
    
    it "should have the right title" do
      visit contact_path
      expect(page).to have_title("#{@base_title} | Contact")
    end

    it "should have a Contact page at '/contact'" do
      visit '/contact'
      expect(page).to have_content('Contact')
    end
  end
  
  describe "GET 'about'" do
    it "returns http success" do
      visit about_path
      response.should be_success
    end
    
    it "should have the right title" do
      visit about_path
      expect(page).to have_title("#{@base_title} | About")
    end

    it "should have a About page at '/about'" do
      visit '/about'
      expect(page).to have_content('About')
    end
  end

    describe "GET 'help'" do
    it "returns http success" do
      visit help_path
      response.should be_success
    end
    
    it "should have the right title" do
      visit help_path
      expect(page).to have_title("#{@base_title} | Help")
    end

    it "should have a Help page at '/help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end
  end
end
