require 'spec_helper'

feature 'Home Page' do
  before do
    @user = FactoryGirl.create :user
  end
  scenario 'Visitor' do
    visit '/'
    page.should have_content 'Home'
  end
end