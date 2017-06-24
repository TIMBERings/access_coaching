# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create(:user, email: 'user@example.com') unless User.where(email: 'user@example.com').any?

%w(Bowling Golf Baseball).each do |sport|
  FactoryGirl.create(:sport, name: sport) unless Sport.where(name: sport).any?
end

post_1 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Baseball'))
post_2 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Bowling'))
post_3 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Golf'))

4.times { FactoryGirl.create(:comment, post: post_1) }
4.times { FactoryGirl.create(:comment, post: post_2) }
2.times { FactoryGirl.create(:comment, post: post_3) }
