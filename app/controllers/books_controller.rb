class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def index
    @debits = Debit.includes(:list)
  end

  def new
    @debit_credit = DebitCredit.new
  end

  def create
    @debit_credit = DebitCredit.new(debit_credit_params)
    if @debit_credit.valid?
      @debit_credit.save
      redirect_to books_path
    else
      render :new
    end
  end

  def search
    @results = @q.result
  end

  private

  def debit_credit_params
    params.require(:debit_credit).permit(:date, :debit_amount, :memo, :d_list_id, :credit_amount, :c_list_id)
  end

  def set_q
    @q = Debit.ransack(params[:q])
  end
end
