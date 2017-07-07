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
      %i[first_name last_name age favourite_week_day].each do |field|
        value = person[field]
        fill_in(field.to_s.humanize, with: value) if value
      end
    end

    context 'when inserting valid data' do
      let :account_data { valid_account_data }

      it 'creates a new account' do
        expect(page).to have_content('Account was successfully created.')
        expect(page).to have_content('Random')
        expect(page).to have_content('Hacker')
      end
    end

    context 'with no first name' do
      let :account_data { valid_account_data.merge(first_name: '') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The first name cannot be empty')
      end
    end

    context 'with a long first name' do
      let :account_data { valid_account_data.merge(first_name: 'Some Very Very Long Name That Should Make Validation Fail Because It Has Too Many Characters In It') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The first name can be at most 30 characters long')
      end
    end

    context 'when inserting no last name' do
      let :account_data { valid_account_data.merge(last_name: '') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The last name cannot be empty')
      end
    end

    context 'with a short last name' do
      let :account_data { valid_account_data.merge(last_name: 'a') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The last name must be at least 2 characters long')
      end
    end

    context 'with a negative age' do
      let :account_data { valid_account_data.merge(age: -2) }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The age must be between 5 and 120')
      end
    end

    context 'with a small age' do
      let :account_data { valid_account_data.merge(age: 3) }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The age must be between 5 and 120')
      end
    end

    context 'with a large age' do
      let :account_data { valid_account_data.merge(age: 121) }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The age must be between 5 and 120')
      end
    end

    context 'with an invalid day of the week' do
      let :account_data { valid_account_data.merge(favourite_week_day: 'Duodi') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('The favourite week day must be one of Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday')
      end
    end

    context 'with an forbidden word in the comment' do
      let :account_data { valid_account_data.merge(comment: 'Some comment from the Knights who say Ni!') }

      it 'fails with an error message' do
        expect(page).not_to have_content('Account was successfully created.')
        expect(page).to have_content('We want a shrubbery!')
      end
    end
  end
end
