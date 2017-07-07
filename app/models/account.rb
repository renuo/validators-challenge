class Account < ApplicationRecord
  min_age = 5
  max_age = 120
  weekdays = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  validates :first_name,
            presence: { message: 'The first name cannot be empty' },
            length: { maximum: 30, message: 'The first name can be at most %{count} characters long' }
  validates :last_name,
            presence: { message: 'The last name cannot be empty' },
            length: { minimum: 2, message: 'The last name must be at least %{count} characters long' }
  validates :age, numericality: {
    greater_than_or_equal_to: min_age,
    less_than: max_age,
    message: "The age must be between #{min_age} and #{max_age}"
  }
  validates :favourite_week_day, inclusion: {
    in: weekdays,
    message: "The favourite week day must be one of #{weekdays.join(', ')}"
  }
  validates :comment, format: { without: /\WNi!+/, message: 'We want a shrubbery!' }
end
