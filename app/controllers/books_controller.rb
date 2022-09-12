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
    @book = Debit.joins(:list, :credit, :user).select('credits.credit_amount', 'debits.debit_amount', 'debits.memo',
                                                      'lists.code_name', 'users.id').find(params[:id])
    redirect_to books_path unless current_user.id == @book.id
  end

  def update
    @book = Debit.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Debit.find(params[:id])
      if book.destroy
        redirect_to books_path
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

  def book_params
  end
end
