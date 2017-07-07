class Account < ApplicationRecord
  validates :first_name,
            presence: { message: 'The first name cannot be empty' },
            length: { maximum: 30, message: 'The first name can be at most %{count} characters long' }
end
