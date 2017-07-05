bowling = FactoryGirl.create(:sport, name: 'bowling') unless Sport.where(name: 'bowling').any?
golf = FactoryGirl.create(:sport, name: 'golf') unless Sport.where(name: 'golf').any?
basketball = FactoryGirl.create(:sport, name: 'basketball') unless Sport.where(name: 'basketball').any?

FactoryGirl.create(:admin, email: 'admin@ac.com') unless User.where(email: 'admin@ac.com').any?
coach = FactoryGirl.create(:coach, email: 'coach@ac.com') unless User.where(email: 'coach@ac.com').any?
coach.sports = [bowling, golf]
athlete = FactoryGirl.create(:athlete, email: 'athlete@ac.com') unless User.where(email: 'athlete@ac.com').any?
athlete.sports = [bowling,basketball]

post_1 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'bowling'))
FactoryGirl.create(:video, post: post_1, video_id: 'https://www.youtube.com/watch?v=u_6tuy_zw1o')
FactoryGirl.create(:video, post: post_1, video_id: 'https://www.youtube.com/watch?v=HeEE1P3cX_w')

post_2 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'basketball'))
FactoryGirl.create(:video, post: post_2, video_id: 'https://www.youtube.com/watch?v=u_6tuy_zw1o')

post_3 = FactoryGirl.create(:post, sport: Sport.find_by(name: 'golf'))

4.times { FactoryGirl.create(:comment, post: post_1) }
4.times { FactoryGirl.create(:comment, post: post_2) }
2.times { FactoryGirl.create(:comment, post: post_3) }
