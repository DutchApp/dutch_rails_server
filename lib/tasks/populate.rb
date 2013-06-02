namespace :db do
  desc 'Repopulate Database'
  task populate: :enviroment do
    require 'populator'
    require 'faker'

    [User, Expense].each(&:delete_all)

    # Test User
    User.create! name: 'Test User',
                 email: 'test@dutch.com',
                 password: 'password',
                 password_confirmation: 'password'

    # Seed Users
    User.populate 100 do |user|
      user.name Faker::Name.name
      user.email Faker::Internet.email
      user.password 'password'
      user.password_confirmation 'password'
    end
  end
end