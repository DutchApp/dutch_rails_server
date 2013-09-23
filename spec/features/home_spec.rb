require 'spec_helper'

feature 'Welcome Page' do
  before do
    #@user = FactoryGirl.create :user
    visit '/'
  end
  subject {page}

  # header
  it {should have_link 'DUTCH'}

  # Banner
  it {should have_title 'Home'}
  it {should have_selector 'h1', text: 'Welcome to Dutch!'}
  it {should have_selector 'p', text: 'Sharing expenses with friends can be fun!'}



end