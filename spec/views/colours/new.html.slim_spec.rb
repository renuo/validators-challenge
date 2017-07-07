require 'rails_helper'

RSpec.describe "colours/new", type: :view do
  before(:each) do
    assign(:colour, Colour.new(
      :name => "MyString"
    ))
  end

  it "renders new colour form" do
    render

    assert_select "form[action=?][method=?]", colours_path, "post" do

      assert_select "input[name=?]", "colour[name]"
    end
  end
end
