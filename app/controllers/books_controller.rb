class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: :index

  def index
    # 今月のデータを取得
    @books = Debit.where(user_id: current_user.id, date: Time.now.all_month)
  end

  def new
    @debit_credit = DebitCredit.new
  end

  def create
    @debit_credit = DebitCredit.new(debit_credit_params)
    # バリデーションを実行
    if @debit_credit.valid?
      @debit_credit.save
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def debit_credit_params
    params.require(:debit_credit).permit(:date, :debit_amount, :memo, :d_list_id, :credit_amount,
                                         :c_list_id).merge(user_id: current_user.id)
  end

  def set_q
    @q = Debit.ransack(params[:q])
  end
end
