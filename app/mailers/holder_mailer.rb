class HolderMailer < ApplicationMailer

  def send_email(holder, user_preferences, beneficiary, subject, text)
    @holder = holder
    @beneficiary = beneficiary
    @text = text

    delivery_options = { 
        address:              user_preferences.smtp_address,
        port:                 user_preferences.smtp_port,
        domain:               user_preferences.smtp_domain,
        user_name:            user_preferences.smtp_user,
        password:             user_preferences.smtp_password,
        authentication:       user_preferences.smtp_authentication,
        enable_starttls_auto: user_preferences.smtp_enable_starttls_auto
    }

    mail(to: @beneficiary.email, subject: subject, delivery_method_options: delivery_options)

  end
end
