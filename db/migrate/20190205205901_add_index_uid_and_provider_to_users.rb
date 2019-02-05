class AddIndexUidAndProviderToUsers < ActiveRecord::Migration[5.2]
  def up
    add_index :users, [:uid, :provider], unique: true
  end

  def down
    remove_index :users, name: :index_users_on_uid_and_provider
  end
end
