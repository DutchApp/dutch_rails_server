require 'spec_helper'

feature 'Home Page' do

  scenario 'layout' do
    visit '/'
    page.should have_title 'DutchApp'
  end
end