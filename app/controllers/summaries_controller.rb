class SummariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @asset = Debit.joins(:list, :credit).select('debits.*', 'lists.code_name',
                                                'credits.credit_amount').where(debits: { date: date, user: current_user })
    # @debt = 
    # @income = 
    # @expence = 
  end

end
