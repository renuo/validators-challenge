class Account < ApplicationRecord
  validates :first_name,
            presence: { message: 'The first name cannot be empty' },
            length: { maximum: 30, message: 'The first name can be at most %{count} characters long' }
  validates :last_name,
            presence: { message: 'The last name cannot be empty' },
            length: { minimum: 2, message: 'The last name must be at least %{count} characters long' }
end
