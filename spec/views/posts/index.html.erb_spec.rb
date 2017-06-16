require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :content => "Content",
        :is_public => false,
        :user => nil
      ),
      Post.create!(
        :content => "Content",
        :is_public => false,
        :user => nil
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
