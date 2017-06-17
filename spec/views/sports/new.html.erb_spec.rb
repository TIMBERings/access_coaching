require 'rails_helper'

RSpec.describe "sports/new", type: :view do
  before(:each) do
    assign(:sport, Sport.new(
      :name => "MyText"
    ))
  end

  it "renders new sport form" do
    render

    assert_select "form[action=?][method=?]", sports_path, "post" do

      assert_select "textarea#sport_name[name=?]", "sport[name]"
    end
  end
end
