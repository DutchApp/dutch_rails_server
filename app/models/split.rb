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

class Split < ActiveRecord::Base
  attr_accessible :expense_id, :contributor_id, :amount
  belongs_to :expense
  belongs_to :contributor, class_name: 'User'
  has_many :feeds, through: :expense
  #validates_numericality_of :amount

  before_save :dutchify_expense

  after_create :add_feed

  def dutchify_expense
    self.amount = self.expense.amount / self.expense.split_count
  end

  def add_feed
    feed = Feed.create(message: "added #{self.contributor.name} to the expense '#{self.expense.name}'")
    feed.user = self.expense.owner
    feed.save!
    self.expense.feeds << feed
    #self.expense.feeds << Feed.create!(message: "added #{self.contributor.name} to the expense '#{self.expense.name}'")
  end
  
  def make_pending
    self.status = PENDING
  end
  
  def pending?
    self.status == PENDING
  end
  
  def accept
    self.status = ACCEPTED
  end
  
  def accepted?
    self.status == ACCEPTED
  end
  
  def reject
    self.status = REJECTED
  end
  
  def rejected?
    self.status == REJECTED
  end
  
  PENDING = 'Pending'
  ACCEPTED = 'Accepted'
  REJECTED = 'Rejected'

end
