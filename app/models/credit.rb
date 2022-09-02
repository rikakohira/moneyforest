class Credit < ApplicationRecord
  belongs_to :debit
  belongs_to :list
end
