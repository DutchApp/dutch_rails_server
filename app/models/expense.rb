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
  attr_accessible :amount, :description, :name, :expense_date, :contributor_tokens, :go_dutch
  attr_accessor :go_dutch
  validates_presence_of :name
  belongs_to :owner,  class_name: 'User'
  validates_numericality_of :amount
  has_many :splits
  has_many :contributors, through: :splits
  has_many :feeds
  attr_reader :contributor_tokens

  after_create :add_create_feed

  def go_dutch?
    self.go_dutch == '1'
  end

  def contributor_tokens=(ids)
    self.contributor_ids = ids.split(',')
    self.split_count = self.contributor_ids.size
  end

  def add_create_feed
    feed = Feed.create(message: "created a new expense")
    feed.user = self.owner
    feed.save!
    self.feeds << feed
  end
end
