require 'rails_helper'

RSpec.describe "colours/index", type: :view do
  before(:each) do
    assign(:colours, [
      Colour.create!(
        :name => "Name 1"
      ),
      Colour.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of colours" do
    render
    assert_select "tr>td", :text => "Name 1".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
  end
end
