# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'factory_girl'
#require 'populator'

# Test user
User.create! name: 'Test User',
             email: 'test@dutch.com',
             password: 'password',
             password_confirmation: 'password'

# Seeded Users
100.times do
  User.create! name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'password',
               password_confirmation: 'password'
end
#User.populate 100 do |user|
#  user.name Faker::Name.name
#  user.email Faker::Internet.email
#  user.password 'password'
#  user.password_confirmation 'password'
#end
