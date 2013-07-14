# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me

  before_save :ensure_authentication_token

  validates_presence_of :name

  has_many :expenses, foreign_key: :owner_id
  has_many :splits, foreign_key: :contributor_id
  has_many :feeds

  def self.search(search)
    if (search && !search.blank?)
      where('name LIKE ?', "%#{search}%")
    else
      []
    end
  end

  def as_json(options=nil)
    #super(only: [:name, :email, :id)
    { :name => self.name, :user_id => self.id, :credit => self.credit, debt: self.debt }
  end

  def credit
    self.expenses.map {|expense| expense['amount']}.reduce(0, :+)
  end

  def debt
    self.splits.map {|split| split['amount']}.reduce(0, :+)
  end


end
