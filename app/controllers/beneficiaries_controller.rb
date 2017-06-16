class BeneficiariesController < ApplicationController
  before_action :set_beneficiary, only: [:show, :edit, :update, :destroy]
  before_action :beneficiary_for_checks, only: [:destroy]

  # GET /beneficiaries
  # GET /beneficiaries.json
  def index
    #@beneficiaries = Beneficiary.where(:holder_id => current_user)    

    @filterrific = initialize_filterrific(
      Beneficiary.where(:holder_id => current_user),
      params[:filterrific],
      select_options: {
        sorted_by: Beneficiary.options_for_sorted_by
      },
      :persistence_id => false,
    ) or return

    @beneficiaries = @filterrific.find.page(params[:page]).per(UserPreferences.find_by(:user_id => current_user.id).pagination_per_page)


    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return

  end

  # GET /beneficiaries/1
  # GET /beneficiaries/1.json
  def show
  end

  # GET /beneficiaries/new
  def new
    @beneficiary = Beneficiary.new
  end

  # GET /beneficiaries/1/edit
  def edit
  end

  # POST /beneficiaries
  # POST /beneficiaries.json
  def create
    @beneficiary = Beneficiary.new(beneficiary_params)
    @beneficiary.holder_id = current_user.id

    respond_to do |format|
      if @beneficiary.save
        format.html { redirect_to @beneficiary, notice: I18n.t('messages.created_with', item: 'Beneficiário') }
        format.json { render :show, status: :created, location: @beneficiary }
      else
        format.html { render :new }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beneficiaries/1
  # PATCH/PUT /beneficiaries/1.json
  def update
    respond_to do |format|
      if @beneficiary.update(beneficiary_params)
        format.html { redirect_to @beneficiary, notice: I18n.t('messages.updated_with', item: 'Beneficiário') }
        format.json { render :show, status: :ok, location: @beneficiary }
      else
        format.html { render :edit }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beneficiaries/1
  # DELETE /beneficiaries/1.json
  def destroy
    respond_to do |format|      
      if beneficiary_for_checks
        format.html { redirect_to beneficiaries_path, alert: I18n.t('messages.destroyed_not_with', item: 'Beneficiário') }
        format.json { head :no_content }
      else
        @beneficiary.destroy
        format.html { redirect_to beneficiaries_path, notice: I18n.t('messages.destroyed_with', item: 'Beneficiário') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beneficiary
      unless validate_beneficiary_access.blank?
        @beneficiary = Beneficiary.find(params[:id])
      else
        redirect_to beneficiaries_path, alert: I18n.t('messages.not_authorized')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beneficiary_params
      params.require(:beneficiary).permit(:name, :email, :address, :phone_1, :phone_2, :holder_id)
    end

    # Verify if the beneficiary is present on the check
    def beneficiary_for_checks
      @beneficiary.checks.length > 0
    end

    def validate_beneficiary_access
      Beneficiary.where(:holder_id => current_user).where(:id => params[:id])
    end
end
