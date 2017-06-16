class HoldersController < ApplicationController
  before_action :set_holder, only: [:index, :show, :edit, :update, :destroy]


  # GET /holders
  # GET /holders.json
  def index
  end



  # GET /holders/1
  # GET /holders/1.json
  def show
  end

  # GET /holders/new
  def new
    @holder = Holder.new
  end

  # GET /holders/1/edit
  def edit
  end

  # POST /holders
  # POST /holders.json
  def create
    @holder = Holder.new(holder_params)

    respond_to do |format|
      if @holder.save
        format.html { redirect_to @holder, notice: I18n.t('messages.created_with', item: 'Titular') }
        format.json { render :show, status: :created, location: @holder }
      else
        format.html { render :new }
        format.json { render json: @holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holders/1
  # PATCH/PUT /holders/1.json
  def update

    respond_to do |format|
      if @holder.update(holder_params)
        format.html { redirect_to holders_path, notice: I18n.t('messages.updated_with', item: 'Titular')}
      else
        format.html { render :edit }
        format.json { render json: @holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holders/1
  # DELETE /holders/1.json
  def destroy
    @holder.destroy
    respond_to do |format|
      format.html { redirect_to holders_path, notice: I18n.t('messages.destroyed_with', item: 'Titular') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holder
      @holder = Holder.find_by(:user => current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holder_params

      params.require(:holder).permit(:name, :cpf, :cnpj,
          :user_attributes => [:email, :password, :password_confirmation]
      )

      if password_blank?
        params[:holder].except!([:user_attributes => [:password, :password_confirmation]])
      end
      
      if email_blank?
        params[:holder].except!([:user_attributes => [:email]])
      end

    end

    def password_blank?
      params[:holder][:user_attributes => [:password]].blank? ||
      params[:holder][:user_attributes => [:password_confirmation]].blank?
    end

    def email_blank?
      params[:holder][:user_attributes => [:email]].blank?
    end
end
