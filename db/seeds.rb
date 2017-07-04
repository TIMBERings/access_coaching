# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create(:admin, email: 'admin@ac.com') unless User.where(email: 'admin@ac.com').any?
FactoryGirl.create(:coach, email: 'coach@ac.com') unless User.where(email: 'coach@ac.com').any?
FactoryGirl.create(:athlete, email: 'athlete@ac.com') unless User.where(email: 'athlete@ac.com').any?

%w(Bowling Golf Baseball).each do |sport|
  FactoryGirl.create(:sport, name: sport) unless Sport.where(name: sport).any?
end

post_1 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Baseball'))
FactoryGirl.create(:video, post: post_1, url: 'https://www.youtube.com/watch?v=u_6tuy_zw1o')
FactoryGirl.create(:video, post: post_1, url: 'https://www.youtube.com/watch?v=HeEE1P3cX_w')

post_2 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Bowling'))
FactoryGirl.create(:video, post: post_2, url: 'https://www.youtube.com/watch?v=u_6tuy_zw1o')

post_3 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'Golf'))

4.times { FactoryGirl.create(:comment, post: post_1) }
4.times { FactoryGirl.create(:comment, post: post_2) }
2.times { FactoryGirl.create(:comment, post: post_3) }
