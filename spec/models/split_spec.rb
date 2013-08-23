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
#  status         :string(255)
#

require 'spec_helper'

describe Split, split: true do
  it {should respond_to :amount}
  it {should respond_to :description}
  it {should respond_to :make_pending}
  it {should respond_to :pending?}
  it {should respond_to :accept}
  it {should respond_to :accepted?}
  it {should respond_to :reject}
  it {should respond_to :rejected?}
  it {should belong_to :expense}
  it {should belong_to :contributor}
  it {should have_many(:feeds)}
  #it {should validate_numericality_of :amount}
end
