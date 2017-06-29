require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 2,
        :favourite_week_day => "Favourite Week Day",
        :comment => "MyText"
      ),
      Account.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 2,
        :favourite_week_day => "Favourite Week Day",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Favourite Week Day".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
