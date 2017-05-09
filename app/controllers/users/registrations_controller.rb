class Users::RegistrationsController < Devise::RegistrationsController
  
  skip_before_action :require_login
  before_action :configure_permitted_parameters

  def new
    build_resource({})
    resource.build_holder
    respond_with self.resource
  end

  def update

  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
          :email, :password, :password_confirmation, 
          :holder_attributes => [:name, :cpf, :cnpj]
        ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
          :email, :password, :password_confirmation
        ])
  end

end







