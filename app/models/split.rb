# == Schema Information
#
# Table name: splits
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  description    :string(255)
#  amount         :decimal(, )
#  expense_id     :integer
#  contributor_id :integer
#

class Split < ActiveRecord::Base
  attr_accessible :expense_id, :contributor_id, :amount
  belongs_to :expense
  belongs_to :contributor, class_name: 'User'
  #validates_numericality_of :amount

  before_save :dutchify_expense

  def dutchify_expense
    self.amount = self.expense.amount / self.expense.split_count
  end

end
