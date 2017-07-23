FactoryGirl.define do
  factory :post_view do
    user
    post
    occurrences 0
    last_accessed_at { 2.days.ago }
  end
end
