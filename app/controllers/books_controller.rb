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

  def edit
    @debit = Debit.joins(:credit).select('debits.*', 'credits.credit_amount', 'credits.c_list_id').find(params[:id])
    debit_attributes = @debit.attributes
    @debit_credit = DebitCredit.new(debit_attributes)
    redirect_to books_path unless current_user.id == @debit.user_id
  end

  def update
    @debit = Debit.find(params[:id])
    @credit = Credit.where(debit_id: @debit.id)
    @debit_credit = DebitCredit.new(debit_credit_params)
    # バリデーションを実行
    if @debit_credit.valid?
      @debit_credit.update(debit_credit_params, @debit, @credit)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Debit.find(params[:id])
    redirect_to books_path if current_user.id == book.user_id && book.destroy
  end

  private

  def debit_credit_params
    params.require(:debit_credit).permit(:date, :debit_amount, :memo, :d_list_id, :credit_amount,
                                         :c_list_id).merge(user_id: current_user.id)
  end

  def set_q
    @q = Debit.ransack(params[:q])
  end

  def book_params
    params.require(:debit).permit(:date, :debit_amount, :memo, :d_list_id, :credit_amount,
                                  :c_list_id).merge(user_id: current_user.id)
  end
end
