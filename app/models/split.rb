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

class Split < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :expense
  belongs_to :split_owner , class_name: :user
  validates_numericality_of :amount
end
