class Video < ActiveRecord::Base
  belongs_to :post

  before_save :convert_video_url

  private

  def convert_video_url
    self.url = YouTubeAddy.extract_video_id(url)
  end
end
