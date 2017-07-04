FactoryGirl.define do
  factory :video do
    post
    url { Faker::Internet.url('example.com') }
  end
end
