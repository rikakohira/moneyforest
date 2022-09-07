class Books::SearchesController < ApplicationController
  

  def index
    @q = Debit.ransack(params[:q])
    # 取得したデータをオブジェクトに変更
    @results = @q.result

    # リクエスト形式によって処理を切り分ける
    respond_to do |format|
      format.html { redirect_to :root_path }
      format.json { render json: @results }
    end

  end
  
end