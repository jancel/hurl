FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :website do |n|
    "http://www.example#{n}.com"
  end
  

end

