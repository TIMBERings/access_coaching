FactoryGirl.define do
  factory :sport do
    name {%w(basketball golf bowling).random}
  end
end
