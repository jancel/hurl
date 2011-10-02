require 'spec_helper'

describe "ShortUrls" do
  include Rack::Test::Methods
  let(:host) {"http://#{APP_CONFIG['host']}"}

  describe "shorten url via interface" do
    it "should shorten url when form filled in" do
      visit new_short_url_path
      fill_in "short_url_long_url", :with => FactoryGirl.generate(:website)
      click_button "Create Short Url"
    end
  end
  
  describe "view shortened url" do
    it "should show the shortened url" do
      visit new_short_url_path
      website_url = "http://www.google.com"
      fill_in "short_url_long_url", :with => website_url
      click_button "Create Short Url"
      page.should have_content("Short Url was successfully created.")
      page.should have_content(website_url)
      click_link website_url
      page.current_host.should eql website_url
    end
    it "should have the short url link" do
      su = ShortUrl.create( :long_url => FactoryGirl.generate(:website) )
      visit short_url_path(su.id)
      page.should have_content("#{host}/#{su.url_hash}")
    end
  end
  
  describe "forward via short url" do
    it "should redirect to destination" do
      lambda {
        website_url = "http://www.google.com"
        su = ShortUrl.create( :long_url => website_url )
        visit "/#{su.url_hash}"
        page.current_host.should eql website_url
      }.should  change(Statistic, :count).by(1)
    end
  end
end
