# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :statistic do
      host "MyString"
      host_with_port "MyString"
      referrer "MyString"
      path "MyString"
      url_hash "MyString"
      ip_address "MyString"
      user_agent "MyString"
      language "MyString"
      processed false
    end
end