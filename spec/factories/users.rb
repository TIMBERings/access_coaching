FactoryGirl.define do
  factory :user, aliases: [:author] do
    sequence :email do |n|
      Faker::Internet.email.gsub('@', "_#{n}@")
    end
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { rand(13*366..50*366).days.ago }
    password 'Test1234'
    password_confirmation 'Test1234'
    role 'athlete'

    factory(:coach, class: User) do
      role 'coach'
    end

    factory(:athlete, class: User) do
      role 'athlete'
    end

    factory(:admin, class: User) do
      role 'admin'
    end
  end
end
