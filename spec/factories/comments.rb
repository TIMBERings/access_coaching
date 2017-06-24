FactoryGirl.define do
  factory :comment do
    post
    content { (0..1).map { "#{Faker::Lorem.paragraph(3)}"}.join("\n") }
    author
  end
end
