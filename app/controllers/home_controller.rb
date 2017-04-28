class HomeController < ApplicationController
  def index
    @beneficiaries = Beneficiary.select(:id).where(:holder_id => current_user.id).count
    @accounts = Account.select(:id).where(:holder_id => current_user.id).count
    @checks = Check.where(:account_id => Holder.find(current_user.id).accounts)

    @checks_today =  @checks.where(:date_discount => Date.today)
    @checks_today_sum = (@checks_today.sum("amount_cents").to_f / 100).to_money

    @checks_week = @checks.where(date_discount: Date.today+1..Date.today+15).order('date_discount ASC')

  end

end
