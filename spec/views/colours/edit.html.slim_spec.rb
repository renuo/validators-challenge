require 'rails_helper'

RSpec.describe "colours/edit", type: :view do
  before(:each) do
    @colour = assign(:colour, Colour.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit colour form" do
    render

    assert_select "form[action=?][method=?]", colour_path(@colour), "post" do

      assert_select "input[name=?]", "colour[name]"
    end
  end
end
