# coding: utf-8
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
    @expense.user_id = @current_user.id

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

  # GET /gasto_por_dia?data=yyyy-mm-dd
  def filter_by_date
    if params[:data].blank?
      render json: {
                     errors: "Parametro Data não informado ou inválido"
                   }, status: :unprocessable_entity
    else
      begin
        periodo = Date.parse(params[:data])

        @expenses = @current_user.expense.filter_by_date(periodo).ordered

        render json: @expenses

      rescue ArgumentError => e
        render json: {
                      errors: "Parametro informado inválido. \n Detalhe:: #{e.message}"
                     }, status: :unprocessable_entity
      end
    end
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
