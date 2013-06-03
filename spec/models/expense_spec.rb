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

require 'spec_helper'

describe Expense do
  
	it {should respond_to :name}
	it {should respond_to :amount}
	it {should respond_to :description}
  it {should respond_to :expense_date}

	it {should belong_to :owner}
	it {should respond_to :splits}
	it {should respond_to :go_dutch?}
	it {should respond_to :contributors}
	it {should respond_to :contributor_tokens}


	it {should validate_presence_of :name}
	it {should validate_numericality_of :amount}

end
