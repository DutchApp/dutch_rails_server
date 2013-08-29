class AddStatusToSplits < ActiveRecord::Migration
  def change
    add_column :splits, :status, :string
  end
end
