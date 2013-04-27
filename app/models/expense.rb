# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  amount      :float
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Expense < ActiveRecord::Base
  attr_accessible :amount, :description, :name
end
