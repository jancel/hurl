require 'spec_helper'

describe 'routes' do
  it "should route to /xyz123" do
     { :get => "/xyz123" }.should route_to(
           :controller => "forward",
           :action => "redirectiones",
           :id => "xyz123",
           :requirements => {"id"=>/[\w_]{5,20}$/}
         )
  end
end