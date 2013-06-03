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
#  expense_date :date
#

class Expense < ActiveRecord::Base
  attr_accessible :amount, :description, :name, :expense_date, :contributor_tokens
  validates_presence_of :name
  belongs_to :owner,  class_name: 'User'
  validates_numericality_of :amount
  has_many :splits
  has_many :contributors, through: :splits
  attr_reader :contributor_tokens

  def contributor_tokens=(ids)
    self.contributor_ids = ids.split(',')
  end
end
