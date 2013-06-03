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

FactoryGirl.define do
  factory :expense do
    name Faker::Lorem.sentence
    amount 100
    description Faker::Lorem.sentence
    #expense_date Date.current
    expense_date '05/11/2013'
    owner_id 1
  end
end
