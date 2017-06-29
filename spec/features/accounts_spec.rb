require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
  before { create(:account) }

  it 'lists all the accounts' do
    visit accounts_path
    within('table') do
      expect(all('td:first-child').map(&:text)).to include('John')
      expect(all('td:nth-child(2)').map(&:text)).to include('Smith')
    end
  end
end
