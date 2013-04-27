class AddSplitOwnerIdToSplit < ActiveRecord::Migration
  def change
    add_column :splits, :split_owner_id, :integer
  end
end
