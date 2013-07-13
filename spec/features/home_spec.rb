require 'spec_helper'

feature 'Home Page' do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  scenario 'Activities' do
    @expense = FactoryGirl.build :expense, owner_id: @user.id
    visit '/'
    page.should have_selector 'h2', text: 'Recent Activity'
  end
end