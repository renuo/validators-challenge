# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
  before { create(:account) }

  describe '#index' do
    it 'lists all the accounts' do
      visit accounts_path
      within('table') do
        expect(all('td:first-child').map(&:text)).to include('John')
        expect(all('td:nth-child(2)').map(&:text)).to include('Smith')
      end
    end
  end

  describe '#new' do
    before do
      visit new_account_path
      fill_form_with account_data
      click_button 'Create Account'
    end
    let :valid_account_data do
      {
        first_name: 'Random',
        last_name: 'Hacker',
        age: 23,
        favourite_week_day: 'Tuesday'
      }
    end

    def fill_form_with(person)
      fill_in('First name', with: person[:first_name])
      fill_in('Last name', with: person[:last_name])
      fill_in('Age', with: person[:age])
      fill_in('Favourite week day', with: person[:favourite_week_day])
    end

    context 'when inserting valid data' do
      let :account_data { valid_account_data }

      it 'creates a new account' do
        expect(page).to have_content('Account was successfully created.')
        expect(page).to have_content('Random')
        expect(page).to have_content('Hacker')
      end
    end

    context 'when inserting no first name' do
      let :account_data { valid_account_data.merge(first_name: '') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The first name cannot be empty')
      end
    end

    context 'when inserting no last name' do
      let :account_data { valid_account_data.merge(last_name: '') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The last name cannot be empty')
      end
    end
  end
end
