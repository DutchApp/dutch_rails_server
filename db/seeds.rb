# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'

FactoryGirl.create(:user, name: 'Test User', email: 'test@dutch.com')
#FactoryGirl.create_list(:user, 100)
100.times do
  FactoryGirl.create(:user)
end
