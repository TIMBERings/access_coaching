require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :content => "MyString",
      :is_public => false,
      :user => nil
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_content[name=?]", "post[content]"

      assert_select "input#post_is_public[name=?]", "post[is_public]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"
    end
  end
end
