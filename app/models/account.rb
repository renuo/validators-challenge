class Account < ApplicationRecord
  validates :first_name, presence: { message: 'The first name cannot be empty' }
end
