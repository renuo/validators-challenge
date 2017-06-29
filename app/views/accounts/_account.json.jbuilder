json.extract! account, :id, :first_name, :last_name, :age, :favourite_week_day, :comment, :created_at, :updated_at
json.url account_url(account, format: :json)
