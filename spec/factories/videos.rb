FactoryGirl.define do
  factory :video do
    post
    video_id { Faker::Internet.url('example.com') }
  end
end
