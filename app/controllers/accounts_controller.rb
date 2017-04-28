class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.to_user(current_user.id, params[:page])
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.holder_id = (current_user.id)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account,  notice: I18n.t('messages.created_with', item: 'Conta') }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account,  notice: I18n.t('messages.updated_with', item: 'Conta') }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_path, notice: I18n.t('messages.destroyed_with', item: 'Conta')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      unless validate_account_access.blank?
        @account = Account.find(params[:id])
      else
        redirect_to accounts_path, alert: I18n.t('messages.not_authorized')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:number, :bank_id, :holder_id , :agency_code)
    end

    def validate_account_access
      #Account.select(:id).where(:holder_id => current_user).where(:id => params[:id])
      Account.to_user_valid( current_user.id, params[:id] )
    end



end
