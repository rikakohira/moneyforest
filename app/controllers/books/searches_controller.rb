class Books::SearchesController < ApplicationController
  
  def index
    date = params[:selectYear] + "-0" + params[:selectMonth] + "-01"
    @books = Debit.joins(:list, :credit).select('credits.credit_amount', 'debits.debit_amount', 'debits.memo', 'lists.code_name').where(debits: {date: date})

    # リクエスト形式によって処理を切り分ける
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @books }
    end
  end
  
end

