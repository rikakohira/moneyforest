class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @debit_credit = DebitCredit.new
  end

  def create
    @debit_credit = DebitCredit.new(debit_credit_params)
    if @debit_amount.valid?
      @debit_credit.save
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def debit_credit_params
    params.require(:debit_credit).permit(:date, :debit_amount, :d_list_id, :credit_amount, :c_list_id)
  end


end

