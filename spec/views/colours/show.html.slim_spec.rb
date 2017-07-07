require 'rails_helper'

RSpec.describe "colours/show", type: :view do
  before(:each) do
    @colour = assign(:colour, Colour.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
