require 'spec_helper'

describe RequestParser do
  # it "should initialize"
  it "should require an Request to be bassed in" do
    lambda {
      r = RequestParser.new()
    }.should raise_error
  end
  
  it "should not raise error when object is passed in" do
    lambda {
      r = RequestParser.new(fake_request)
    }.should_not raise_error
  end
  
  it "should increase statistics by one" do
    lambda {
      RequestParser.new(fake_request)
    }.should change(Statistic, :count).by(1)
  end
  
  describe "host with port" do
    it "should concatenate host:port" do
      r = RequestParser.new(fake_request)
      r.host_with_port.should eql "localhost:3000"
    end
  end
  
  describe "url hash" do
    it "should strip path properly of leading slash" do
      r = RequestParser.new(fake_request)
      r.url_hash.should eql "12345"
    end
  end
  
  describe "nil values" do
    context "fail gracefullywith nil" do
      before(:each) do
        @req = fake_request
      end
      
      it "should accept host" do
        @req.host = nil
        check(@req)
      end
      it "should accept port" do
        @req.port = nil
        check(@req)
      end
      it "should accept referrer" do
        @req.referrer = nil
        check(@req)
      end
      it "should accept path" do
        @req.path = nil
        check(@req)
      end
      it "should accept ip" do
        @req.ip = nil
        check(@req)
      end
      it "should accept http referrer" do
        @req.referrer = nil
        check(@req)
      end
      it "should accept accept language" do
        @req.accept_language = nil
        check(@req)
      end
      
      def check(req)
        lambda {
          r = RequestParser.new(req)
        }.should_not raise_error
      end
    end
  end
  
  def fake_request
    @request ||= Request.new
  end
end

# Dummy class to meet needs of request parser
class Request
  attr_accessor :host, :port, :referrer, :path, :ip, :user_agent, :accept_language
  
  def initialize
    @host = "localhost"
    @port = "3000"
    @referrer = "http://example.com"
    @path = "/12345"
    @ip = "1.1.1.1"
    @user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:7.0) Gecko/20100101 Firefox/7.0"
    @accept_language = "us-en,en;v2.0"
  end
end