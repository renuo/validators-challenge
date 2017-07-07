class AddNotNullOnAccountFirstName < ActiveRecord::Migration[5.1]
  def change
    change_column_null :accounts, :first_name, false
  end
end
