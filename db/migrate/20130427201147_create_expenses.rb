class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.string :description

      t.timestamps
    end
  end
end
