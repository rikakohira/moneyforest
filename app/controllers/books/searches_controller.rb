class Books::SearchesController < ApplicationController
  
  def index
    date = params[:selectYear] + "-0" + params[:selectMonth] + "-01"
    @books = Debit.includes(:list, :credit).where(date: date)
    # binding.pry

    # リクエスト形式によって処理を切り分ける
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @books }
    end
  end
  
end

