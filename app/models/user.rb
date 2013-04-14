class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  before_save { |user| user.email = email.downcase }

  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation

end
