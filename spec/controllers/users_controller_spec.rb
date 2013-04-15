require 'spec_helper'

describe UsersController, user: true do

  let(:user) {FactoryGirl.create :user}

  describe "index" do
    it "renders /users/index view" do
      get :index
      expect(response.code).to eq('302')
    end
  end

end