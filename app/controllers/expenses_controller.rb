class ExpensesController < ApplicationController
  before_action :authorize_request
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    @expenses = @current_user.expense.all.ordered

    render json: @expenses
  end

  # GET /expenses/1
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: @expense, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
  end

  # GET
  def filter_by_date(period)
    @expenses = @current_user.expense.filter_by_date(period).ordered
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = @current_user.expense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:descricao, :valor, :data, :user_id)
    end
end
