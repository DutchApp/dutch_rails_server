class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params['expense'])
    @expense.user = current_user
    if @expense.save
      render :show
    else
      flash.warning = 'Error'
    end
  end
end
