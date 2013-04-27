# == Schema Information
#
# Table name: splits
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  amount      :decimal(, )
#

require 'spec_helper'

describe Split do
  it {should respond_to :amount}
  it {should respond_to :description}
  it {should belong_to :expense}
  it {should belong_to :split_owner}
  it {should validate_numericality_of :amount}
end
