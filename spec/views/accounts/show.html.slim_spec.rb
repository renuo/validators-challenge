require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :age => 2,
      :favourite_week_day => "Favourite Week Day",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Favourite Week Day/)
    expect(rendered).to match(/MyText/)
  end
end
