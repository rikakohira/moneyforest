class Books::SearchesController < ApplicationController
  def index
    date = params[:selectYear] + '-0' + params[:selectMonth] + '-01'
    @books = Debit.joins(:list, :credit, :user).select('debits.debit_amount', 'debits.memo', 'lists.code_name', 'credits.credit_amount',
                                                       'users.id').where(debits: { date: date,
                                                                                   user: current_user })

    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @books }
    end
  end
end
