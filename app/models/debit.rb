class Debit < ApplicationRecord
  has_one :credit
  belongs_to :list
end
