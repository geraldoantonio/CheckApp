class HolderMailer < ApplicationMailer

  def send_email(holder, beneficiary, subject, text)
    @holder = holder
    @beneficiary = beneficiary
    @text = text

    mail(to: @beneficiary.email, subject: subject)

  end
end
