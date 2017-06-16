class UserPreferencesController < ApplicationController


  before_action :set_user_preferences, only: [:edit, :update]

  def edit
  end
  
  def update
    respond_to do |format|
      if @user_preferences.update(user_preferences_params)
        format.html { redirect_to edit_user_preference_path, notice: I18n.t('messages.updated_with', item: 'Preferência do Usuário') }
        format.json { render :show, status: :ok, location:  @user_preferences }
      else
        format.html { render :edit }
        format.json { render json:  @user_preferences.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_preferences
      @user_preferences = UserPreferences.find_or_create_by!(:user => current_user)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_preferences_params
      params.require(:user_preferences).permit(:pagination_per_page, :email_type, :smtp_address, 
        :smtp_port, :smtp_domain, :smtp_user, :smtp_password, :smtp_authentication,
        :smtp_enable_starttls_auto, :check_value_featured, :check_date_near )
    end

end
