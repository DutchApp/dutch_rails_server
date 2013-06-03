class RenameUserIdToOwnerId < ActiveRecord::Migration
  def up
    rename_column :expenses, :user_id, :owner_id
  end

  def down
    rename_column :expenses, :owner_id, :user_id
  end
end
