require 'spec_helper'

describe Split do
  it {should respond_to :amount}
  it {should respond_to :description}
  it {should belong_to :expense}
  it {should belong_to :split_owner}
  it {should validate_numericality_of :amount}
end
