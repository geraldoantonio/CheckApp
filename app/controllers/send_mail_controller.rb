class SendMailController < ApplicationController

  def edit
    @beneficiary = Beneficiary.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @beneficiary = Beneficiary.find(params[:'recipient-id']);
    begin
      HolderMailer.send_email(  Holder.find(current_user.id), 
                                @beneficiary, 
                                params[:'subject-text'],
                                params[:'message-text']
                              ).deliver_now

      @notify_message = I18n.t('messages.email_delivered')
      @notify_flag = "success"
    rescue
      @notify_message = I18n.t('messages.email_not_delivered')
      @notify_flag = "error"
    end

    respond_to do |format|
      format.js
    end
  end

end
  
