require 'spec_helper'

describe ShortUrl do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do
    context "long url" do
      it "should pass when included" do
        short_url = ShortUrl.create( :long_url => website, :url_hash => "google")
        short_url.should be_valid
      end
      
      it "should fail when not there" do
        ShortUrl.create.should_not be_valid
      end
    end
    
    context "url hash" do
      it "should be unique" do
        short_url = ShortUrl.create(:long_url => website, :url_hash => "google")
        ShortUrl.create(:long_url => website, :url_hash => "google").should_not be_valid
      end
      it "should be assigned if not provided" do
        short_url = ShortUrl.create(:long_url => website)
        short_url.url_hash.should_not be_nil
      end
      it "should be required" do
        short_url = ShortUrl.create(:long_url => website)
        short_url.should be_valid
      end
      it "should not be overwritten" do
        short_url = ShortUrl.create( :long_url => website, :url_hash => "google")
        short_url.url_hash.should eql "google"
      end
      it "should set url hash" do
        ShortUrl.new.set_url_hash.should_not be_nil
      end
      it "should require minimum length" do
        short_url = ShortUrl.create(:long_url => website, :url_hash => "goog")
        short_url.should_not be_valid
        short_url2 = ShortUrl.create(:long_url => website, :url_hash => "googl")
        short_url2.should be_valid
      end
      it "should require maximum length" do
        short_url = ShortUrl.create(:long_url => website, :url_hash => "goog12389012345678901")
        short_url.should_not be_valid
        short_url2 = ShortUrl.create(:long_url => website, :url_hash => "goog1238901234567890")
        short_url2.should be_valid
      end
    end 
  end
  
  describe "scopes and class methods" do
    context "first by hash" do
      it "should have one result" do
        website_url = website
        short_url = ShortUrl.create(:long_url => website_url, :url_hash => "goog12")
        ShortUrl.first_by_hash("goog12").first.long_url.should eql (website_url)
        ShortUrl.first_by_hash("goog12").count.should eql 1
      end
      it "should return no result" do
        ShortUrl.first_by_hash("goog12").count.should eql 0
      end
    end
    
    context "url_hash available" do
      it "should be available if it isn't assigned" do
        short_url = ShortUrl.hash_available?("google")
        short_url.should eql(true)
      end
      it "should not be available if it's assigned" do
        short_url2 = ShortUrl.create(:long_url => website, :url_hash => "googl")
        short_url2.should be_valid
        ShortUrl.hash_available?("googl").should be_false
      end
    end
    
    context "by hash" do
      it "should return the right long url" do
        website_url = website
        short_url = ShortUrl.create(:long_url => website_url, :url_hash => "goog12")
        ShortUrl.by_hash("goog12").long_url.should eql (website_url)
      end
      it "should return nil if hash is not used" do
        ShortUrl.by_hash("123").should be_blank
      end
    end
    context "url by hash" do
      it "should return the right long url" do
        website_url = website
        short_url = ShortUrl.create(:long_url => website_url, :url_hash => "goog12")
        ShortUrl.url_by_hash("goog12").should eql (website_url)
      end
      it "should return nil if hash is not used" do
        ShortUrl.url_by_hash("123").should be_blank
      end
    end
    
    describe "attributes" do
      context "host" do
        it "should get set when creating a short url" do
          s = ShortUrl.create( :long_url => website )
          s.host.should eql APP_CONFIG['host']
        end
      end
    end
  end
  
  def website
    FactoryGirl.generate(:website)
  end
end
