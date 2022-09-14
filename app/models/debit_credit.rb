class DebitCredit
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :date, :debit_amount, :memo, :d_list_id, :user_id, :credit_amount, :c_list_id, :id, :created_at, :datetime,
                :updated_at, :datetime

  with_options presence: true do
    validates :date
    validates :debit_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :d_list_id
    validates :user_id
    validates :credit_amount, numericality: { only_integer: true, less_than_or_equal_to: 0 }
    validates :c_list_id
  end

  def save
    debit = Debit.create(date: date, debit_amount: debit_amount, memo: memo, d_list_id: d_list_id, user_id: user_id)
    Credit.create(credit_amount: credit_amount, c_list_id: c_list_id, debit_id: debit.id)
  end

  def update(params, debit, credit)
    debit.update(debit_amount: params[:debit_amount], memo: params[:memo], d_list_id: params[:d_list_id],
                user_id: params[:user_id])
    credit.update(credit_amount: params[:credit_amount], c_list_id: params[:c_list_id], debit_id: debit.id)
  end
end
