class Books::SearchesController < ApplicationController
  
  def index
    date = params[:selectYear] + "-0" + params[:selectMonth] + "-01"
    @books = Debit.where(date: date).includes(:list)


    # リクエスト形式によって処理を切り分ける
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @books }
    end
  end
  
end