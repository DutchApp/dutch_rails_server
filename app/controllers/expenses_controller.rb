class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params['expense'])
    if @expense.save
      render :show
    else
      flash.warning = 'Error'
    end
  end
end
