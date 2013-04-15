class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    remove_index :users, :email
    add_index :users, [:authentication_token, :email],  unique: true
  end
end
