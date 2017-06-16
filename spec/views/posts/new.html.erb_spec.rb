require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :content => "MyString",
      :is_public => false,
      :user => nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_content[name=?]", "post[content]"

      assert_select "input#post_is_public[name=?]", "post[is_public]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"
    end
  end
end
