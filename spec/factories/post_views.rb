FactoryGirl.define do
  factory :post_view do
    user
    post
    occurrences 0
    last_accessed { 2.days.ago }
  end
end
