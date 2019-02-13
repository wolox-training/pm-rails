#
# Based on: https://github.com/lynndylanhurley/devise_token_auth/issues/181#issuecomment-215675266
#
class AddDeviseTokenAuthFieldsToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
  end

  def down
    remove_columns :users, :provider, :uid, :tokens
  end
end
