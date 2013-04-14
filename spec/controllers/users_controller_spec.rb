require 'spec_helper'

describe UsersController, user: true do

  let(:user) {FactoryGirl.create :user}

  describe "index" do
    it "renders /users/index view" do
      get :index
      expect(response.code).to eq('200')
      expect(response).to render_template('index')
    end
  end

  describe "new" do
    it "renders /users/new view" do
      get :new
      expect(response.code).to eq('200')
      expect(response).to render_template('new')
    end
  end

  describe "show" do
    it "renders /users/show view" do
      get :show, id: user
      expect(response.code).to eq('200')
      expect(response).to render_template('show')
    end
  end

  describe "edit" do
    it "renders /users/edit view" do
      get :edit, id: user
      expect(response.code).to eq('200')
      expect(response).to render_template('edit')
    end
  end

  pending "update" do
    before do
      @saved_user = FactoryGirl.create(:user)
      @saved_user.email = 'new@dutch.com'
    end
    it "renders /users/show view" do
      put :update, id: @saved_user
      expect(response.code).to eq('200')
      expect(response).to render_template('show')
    end
  end

  pending "destroy" do
    before {@saved_user = FactoryGirl.create(:user)}
    it "renders /users/index view" do
      delete :destroy, id: @saved_user
      expect(response).to render_template('index')
    end
  end

end