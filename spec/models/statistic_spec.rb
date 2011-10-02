require 'spec_helper'

describe Statistic do
  it "should create statistic" do
    lambda {
      Statistic.create(:host => "localhost")
    }.should change(Statistic, :count).by(1)
  end
end
