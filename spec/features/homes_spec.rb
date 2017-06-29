require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  describe "Opening the homepage" do
    it "displays the homepage" do
      visit '/'
      expect(page).to have_content('Welcome')
    end
  end
end
