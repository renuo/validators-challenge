require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :age => 1,
      :favourite_week_day => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input[name=?]", "account[first_name]"

      assert_select "input[name=?]", "account[last_name]"

      assert_select "input[name=?]", "account[age]"

      assert_select "input[name=?]", "account[favourite_week_day]"

      assert_select "textarea[name=?]", "account[comment]"
    end
  end
end
