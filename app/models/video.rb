class Video < ActiveRecord::Base
  belongs_to :post

  before_save :convert_video_video_id

  private

  def convert_video_video_id
    self.video_id = YouTubeAddy.extract_video_id(video_id)
  end
end
