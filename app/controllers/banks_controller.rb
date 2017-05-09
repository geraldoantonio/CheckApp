class BanksController < ApplicationController

  # GET /banks
  # GET /banks.json
  def index

    @filterrific = initialize_filterrific(
      Bank,
      params[:filterrific],
      select_options: {
        sorted_by: Bank.options_for_sorted_by
      }
    ) or return

    @banks = @filterrific.find.page(params[:page])


    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to banks_path, notice: I18n.t('messages.created_with', item: 'Banco')}
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:bank_name, :id)
    end
end
