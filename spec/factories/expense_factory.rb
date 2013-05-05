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
#  user_id      :integer
#  expense_date :datetime
#

FactoryGirl.define do
  factory :expense do
    name Faker::Lorem.sentence
    amount 100
    description Faker::Lorem.sentence
    expense_date Date.current
    user_id 1
  end
end
