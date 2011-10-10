require 'spec_helper'

describe ForwardController do
  describe "get requests" do
    before(:each) do
      @url = ShortUrl.create(:long_url => FactoryGirl.generate(:website))
    end
    it "should redirect to url_hash" do
      get("redirectiones", :id => "#{@url.url_hash}").should be_redirect
    end
    it "should redirect to show page" do
      get("redirectiones", :id => "#{@url.url_hash}-").should redirect_to(short_url_path(@url.id))
    end
    it "should go to error page" do
      get("redirectiones", :id => "whatevs").should redirect_to page_path("error")
    end
    it "should go to error page with a -" do
      get("redirectiones", :id => "whatevs-").should redirect_to page_path("error")
    end
  end
end