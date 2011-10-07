FactoryGirl.define do
  factory :short_url do
    long_url "http://www.exampple.com"
    url_hash "xyz123"
    private false
    spam false
    active true
  end
end