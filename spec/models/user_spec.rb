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

require 'spec_helper'

describe User, user: true do

  let(:user) {FactoryGirl.create :user}

  subject {user}

  it {should respond_to :name}
  it {should respond_to :email}
  it {should respond_to :password}
  it {should respond_to :password_confirmation}
  it {should respond_to :expenses}


  it {should be_valid}

  describe "when name is blank" do
    before {user.name = " " }
    it {should_not be_valid}
  end

  describe "when email is blank" do
    before {user.email = " " }
    it {should_not be_valid}
  end

  describe "when email is invalid" do
    before {user.email = "abhifoofoo" }
    it {should_not be_valid}
  end

  describe "when email is taken" do
    let(:dup_user) {user.dup}

    subject {dup_user}

    it {should_not be_valid}
  end

  describe "when password is blank" do
    before {user.password = " " }
    it {should_not be_valid}
  end

  describe "when password_confirmation is blank" do
    before {user.password = " " }
    it {should_not be_valid}
  end

  describe "when password does not match confirmation" do
    before {user.password_confirmation = "foobar" }
    it {should_not be_valid}
  end



end
