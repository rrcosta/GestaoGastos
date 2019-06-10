class OutlaysController < ApplicationController
  before_action :set_outlay, only: [:show, :update, :destroy]

  # GET /outlays
  def index
    @outlays = Outlay.all

    render json: @outlays
  end

  # GET /outlays/1
  def show
    render json: @outlay
  end

  # POST /outlays
  def create
    @outlay = Outlay.new(outlay_params)

    if @outlay.save
      render json: @outlay, status: :created, location: @outlay
    else
      render json: @outlay.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outlays/1
  def update
    if @outlay.update(outlay_params)
      render json: @outlay
    else
      render json: @outlay.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outlays/1
  def destroy
    @outlay.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outlay
      @outlay = Outlay.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outlay_params
      params.require(:outlay).permit(:description, :value, :date_operation, :user_id)
    end
end
