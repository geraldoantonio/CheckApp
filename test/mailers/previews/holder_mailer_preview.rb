# Preview all emails at http://localhost:3000/rails/mailers/holder_mailer
class HolderMailerPreview < ActionMailer::Preview

  def send_email
    HolderMailer.send_email(Holder.first, Beneficiary.first, "Email Teste", "Mensagem de teste")
  end
end
