require 'rails_helper'

RSpec.describe "sports/index", type: :view do
  before(:each) do
    assign(:sports, [
      Sport.create!(
        :name => "MyText"
      ),
      Sport.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of sports" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
