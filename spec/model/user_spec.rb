require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.create :user}

  subject {user}

  it {should respond_to :name}
  it {should respond_to :email}
  it {should respond_to :password_digest}
  it {should respond_to :password}
  it {should respond_to :password_confirmation}


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
