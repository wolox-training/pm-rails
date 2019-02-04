class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, limit: 50, null: false, required: true
    add_column :users, :last_name, :string, limit: 50, null: false, required: true
  end
end
