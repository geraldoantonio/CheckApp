class HomeController < ApplicationController
  def index

    @holder = Holder.where(:user_id => current_user.id)
    @beneficiaries = Beneficiary.where(:holder_id => @holder)

    @accounts = Account.select(:id).where(:holder_id => @holder)

    @checks = Check.where(:account_id => @accounts)

    @checks_today =  @checks.where(:date_discount => Date.today)
    @checks_today_sum = (@checks_today.sum("amount_cents").to_f/100).to_money

    @checks_week = @checks.where(date_discount: Date.today+1..Date.today+15).order('date_discount ASC')

    @checks_amount_limit = @checks.where("date_discount >= ?", Date.today).where("amount_cents >= ?", 150000).order('date_discount ASC')
  end

end
