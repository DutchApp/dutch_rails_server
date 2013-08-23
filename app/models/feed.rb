# == Schema Information
#
# Table name: feeds
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :integer
#  user_id    :integer
#

class Feed < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  attr_accessible :message
  belongs_to :user

  def to_s(current_user)
    if self.user.eql? current_user
      "You #{self.message} #{distance_of_time_in_words_to_now(self.created_at)} ago"
    else
      "#{self.user.name} #{self.message} #{distance_of_time_in_words_to_now(self.created_at)} ago"
    end
  end
end
