FactoryGirl.define do
  factory :post do
    content "MyString"
    is_public false
    user nil
  end
end
