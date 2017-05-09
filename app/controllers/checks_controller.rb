class ChecksController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]

  # GET /checks
  # GET /checks.json
  def index

    @filterrific = initialize_filterrific(
      Check.where(:account_id => Holder.find(current_user.id).accounts),
      params[:filterrific],
      select_options: {
        sorted_by: Check.options_for_sorted_by,
        with_beneficiary_id: Beneficiary.options_for_select
      },
      default_filter_params: {
        with_date_discount_gte: Date.today,
        with_date_discount_lt: Date.today+7
      }
    ) or return

    @checks = @filterrific.find.page(params[:page])


    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return

  end

  # GET /checks/1
  # GET /checks/1.json
  def show
  end

  # GET /checks/new
  def new
    @check = Check.new
  end

  # GET /checks/1/edit
  def edit
  end

  # POST /checks
  # POST /checks.json
  def create
    @check = Check.new(check_params)

    respond_to do |format|
      if @check.save
        format.html { redirect_to @check, notice: I18n.t('messages.created_with', item: 'Cheque') }
        format.json { render :show, status: :created, location: @check }
      else
        format.html { render :new }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checks/1
  # PATCH/PUT /checks/1.json
  def update
    respond_to do |format|
      if @check.update(check_params)
        format.html { redirect_to @check, notice: I18n.t('messages.updated_with', item: 'Cheque') }
        format.json { render :show, status: :ok, location: @check }
      else
        format.html { render :edit }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to checks_url, notice: I18n.t('messages.destroyed_with', item: 'Cheque') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      unless validate_check_access.blank?
        @check = Check.find(params[:id])
      else
        redirect_to checks_path, alert: I18n.t('messages.not_authorized')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_params
      params.require(:check).permit(:number, :account_id, :date_discount, :beneficiary_id, :amount, :status)
    end



    def validate_check_access
      Check.select(:id).where(:account_id => Holder.find(current_user.id).accounts).where(:id => params[:id])
    end
end
