class RenameSplitOwnerIdToContributorIdInSplit < ActiveRecord::Migration
  def up
    rename_column :splits, :split_owner_id, :contributor_id
  end

  def down
    rename_column :splits, :contributor_id, :split_owner_id
  end
end
