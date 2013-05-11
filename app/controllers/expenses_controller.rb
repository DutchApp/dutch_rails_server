class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params['expense'])
    # TODO: verify date format
    #@expense.expense_date = Date.strptime(params['expense']['expense_date'], '%m/%d/%Y')
    @expense.user = current_user
    if @expense.save
      render :show
    else
      flash.warning = 'Error'
    end
  end

  def index
     @expenses = current_user.expenses

  end

  def show
    @expense = Expense.find(params[:id])
  end
end
