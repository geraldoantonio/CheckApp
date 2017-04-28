class ApplicationController < ActionController::Base

  before_action :require_login
  
  include Pundit
  protect_from_forgery with: :exception

  layout :layout_by_resource



  private

    def require_login
      unless current_user
        redirect_to user_session_path
      end
    end


  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise"
    else
      "application"
    end
  end



end
