class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation
end
