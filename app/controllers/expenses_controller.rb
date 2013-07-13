class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  # POST /expenses
  # POST /expenses.json
  def create
    respond_to do |format|
      @expense = Expense.new(params['expense'])
      # TODO: verify date format
      @expense.expense_date = Date.strptime(params['expense']['expense_date'], '%m/%d/%Y')
      @expense.owner = current_user
      if @expense.save
        format.html {render :show}
        #format.json {render json:{message: t(:expenses_messages_created) }, status: :created}
        format.json {render json:{message: 'Expense Created' }, status: :created}
      else
        format.html {render :new}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  def index
     @expenses = current_user.expenses
  end

  def show
    @expense = Expense.find(params[:id])
  end

end
