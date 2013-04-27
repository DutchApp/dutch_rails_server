class AddColumnsToSplit < ActiveRecord::Migration
  def change
    add_column :splits, :description, :string
    add_column :splits, :amount, :decimal
  end
end
