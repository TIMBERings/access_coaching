require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :post => nil
      ),
      Video.create!(
        :post => nil
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
