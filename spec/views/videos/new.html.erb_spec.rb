require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :post => nil
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_post_id[name=?]", "video[post_id]"
    end
  end
end
