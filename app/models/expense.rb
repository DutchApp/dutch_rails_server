# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  amount       :float
#  description  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  expense_date :datetime
#

class Expense < ActiveRecord::Base
  attr_accessible :amount, :description, :name, :expense_date
  validates_presence_of :name
  belongs_to :owner, class_name: :user, foreign_key: :owner_id
  validates_numericality_of :amount
  has_many :splits
end
