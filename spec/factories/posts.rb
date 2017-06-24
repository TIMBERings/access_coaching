FactoryGirl.define do
  factory :post do
    content { (0..rand(2..4)).map { "#{Faker::Lorem.paragraph(5)}"}.join("\n") }
    is_public true
    author
    sport
  end
end
