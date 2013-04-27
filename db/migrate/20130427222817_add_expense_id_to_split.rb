class AddExpenseIdToSplit < ActiveRecord::Migration
  def change
  	add_column :splits, :expense_id, :integer
  end
end
