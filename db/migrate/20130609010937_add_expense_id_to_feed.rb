class AddExpenseIdToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :expense_id, :integer
  end
end
