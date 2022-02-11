class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: %i[ show edit update destroy ]
  before_action :set_timesheet_to_latest_for_user, only: %i[ show_latest ]
  before_action :set_editable_from_timesheet, only: %i[ show edit update destroy ]
  before_action :set_user_from_timesheet, only: %i[ show edit update destroy ]

  # GET /timesheets or /timesheets.json
  def index
    @timesheets = Timesheet.where(user: current_user).order(created_at: :desc)
  end

  # GET /timesheets/1 or /timesheets/1.json
  def show
  end

  # GET /latest_timesheet
  def show_latest
    if @timesheet.nil?
      redirect_to action: 'index'
    else
      render action: 'show', id: @timesheet.id
    end
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets or /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to timesheet_url(@timesheet), notice: "Timesheet was successfully created." }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1 or /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to timesheet_url(@timesheet), notice: "Timesheet was successfully updated." }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1 or /timesheets/1.json
  def destroy
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: "Timesheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    def set_timesheet_to_latest_for_user
      @timesheet = get_latest_timesheet_for_user
    end

    # Only allow a list of trusted parameters through.
    def timesheet_params
      params.require(:timesheet).permit(:user_id, :pay_period_id)
    end

    def set_editable_from_timesheet
      @editable = @timesheet.id == self.helpers.get_latest_timesheet(user: current_user).id
    end

    def set_user_from_timesheet
      @user = User.where(id: @timesheet.user_id)
    end

    def set_pay_period_from_timesheet
      @pay_period = PayPeriod.where(id: @timesheet.pay_period_id)
    end
end
