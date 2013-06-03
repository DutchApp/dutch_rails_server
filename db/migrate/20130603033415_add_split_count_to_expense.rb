class AddSplitCountToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :split_count, :integer
  end
end
