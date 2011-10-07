require 'spec_helper'

describe 'routes' do
  it "should route short_url request for /xyz123 to forward#redirectiones" do
     { :get => "/xyz123" }.should route_to(
           :controller => "forward",
           :action => "redirectiones",
           :id => "xyz123" )
  end
  it "should redirect to statistics short_url/:id" do
    { :get => "/xyz123-" }.should route_to(
      :controller => "forward",
      :action => "redirectiones",
      :id => "xyz123-"
    )
  end
end