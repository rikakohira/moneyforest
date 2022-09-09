class Books::SearchesController < ApplicationController
  def index
    date = params[:selectYear] + '-0' + params[:selectMonth] + '-01'
    @books = Debit.joins(:list, :credit, :user).select('credits.credit_amount', 'debits.debit_amount', 'debits.memo',
                                                       'lists.code_name', 'users.id').where(debits: { date: date,
                                                                                                      user_id: current_user.id })

    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @books }
    end
  end
end
