require 'spec_helper'

describe HomeController, home: true do

  describe "index" do
    it "renders /users/index view" do
      get :index
      expect(response.code).to eq('302')
    end
  end

end
