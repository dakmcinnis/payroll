class PayPeriodsController < ApplicationController
  before_action :set_pay_period, only: %i[ show edit update destroy ]

  # GET /pay_periods or /pay_periods.json
  def index
    @pay_periods = PayPeriod.all
  end

  # GET /pay_periods/1 or /pay_periods/1.json
  def show
  end

  # GET /pay_periods/new
  def new
    @pay_period = PayPeriod.new
  end

  # GET /pay_periods/1/edit
  def edit
  end

  # POST /pay_periods or /pay_periods.json
  def create
    @pay_period = PayPeriod.new(pay_period_params)

    respond_to do |format|
      if @pay_period.save
        format.html { redirect_to pay_period_url(@pay_period), notice: "Pay period was successfully created." }
        format.json { render :show, status: :created, location: @pay_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pay_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_periods/1 or /pay_periods/1.json
  def update
    respond_to do |format|
      if @pay_period.update(pay_period_params)
        format.html { redirect_to pay_period_url(@pay_period), notice: "Pay period was successfully updated." }
        format.json { render :show, status: :ok, location: @pay_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pay_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_periods/1 or /pay_periods/1.json
  def destroy
    @pay_period.destroy

    respond_to do |format|
      format.html { redirect_to pay_periods_url, notice: "Pay period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_period
      @pay_period = PayPeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pay_period_params
      params.require(:pay_period).permit(:start, :end, :call)
    end
end
