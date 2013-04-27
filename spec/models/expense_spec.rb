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

require 'spec_helper'

describe Expense do
  
	it {should respond_to :name}
	it {should respond_to :amount}
	it {should respond_to :description}

	it {should belong_to :owner}
	pending {should respond_to :contributors}

	it {should validate_presence_of :name}
	it {should validate_numericality_of :amount}

end
