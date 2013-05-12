require 'spec_helper'

describe ExpensesController do

  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "GET 'new'" do
    it "renders 'new' template" do
      get 'new'
      response.should be_success
      response.should render_template :new
    end
  end

  describe "GET 'index'" do
    it "renders 'index' template" do
      get :index
      response.should be_success
      response.should render_template(:index)
    end
  end

  describe "GET 'show'" do
    before do
      @expense = FactoryGirl.create(:expense)
    end
    it "renders 'show' template" do
      get :show, id: @expense
      response.should be_success
      response.should render_template(:show)
      assigns(:expense).should eq(@expense)
    end
  end

end
