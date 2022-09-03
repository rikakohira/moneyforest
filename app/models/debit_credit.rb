class DebitCredit
	include ActiveModel::Model
  attr_accessor :date, :debit_amount, :d_list_id, :credit_amount, :c_list_id
  
  with_options presence: true do
    validates :date
    validates :debit_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :d_list_id
    validates :credit_amount, numericality: { only_integer: true, less_than_or_equal_to: 0 }
    validates :c_list_id
  end

  def save
    debit = Debit.create(date: date, debit_amount: debit_amount, d_list_id: d_list_id)
    Credit.create(credit_amount: credit_amount, c_list_id: c_list_id, debit_id: debit.id)
  end
end