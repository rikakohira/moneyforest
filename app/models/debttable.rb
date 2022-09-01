class Debttable < ApplicationRecord
  with_options presence: true do
    validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end

  belongs_to :user, optional: true
  belongs_to :list
end
