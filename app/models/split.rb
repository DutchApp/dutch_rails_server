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
#  split_owner_id :integer
#

class Split < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :expense
  belongs_to :user
  validates_numericality_of :amount
end
