require 'spec_helper'

feature 'Expense Management' do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  scenario 'user creates new expense page' do
    @expense = FactoryGirl.build :expense, user_id: @user.id
    visit '/expenses/new'

    fill_in 'Title', with: @expense.name
    fill_in 'expenseDate', with: @expense.expense_date
    fill_in 'Description', with: @expense.description
    fill_in 'Amount', with: @expense.amount

    expect{click_button 'Create Expense'}.to change(Expense, :count).by(1)
  end

  scenario 'User views list of expenses' do
    FactoryGirl.create :expense, user_id: @user.id
    visit '/expenses/'

    @user.expenses.each do |expense|
      expect(page).to have_content expense.name
    end
  end

  scenario 'Expense owner views an expense' do
    @expense = FactoryGirl.create :expense, user_id: @user.id
    visit "/expenses/#{@expense.id}"

    expect(page).to have_selector 'h1', text: @expense.name
  end
end