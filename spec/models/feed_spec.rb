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

require 'spec_helper'

describe Feed do
  pending "add some examples to (or delete) #{__FILE__}"
end
