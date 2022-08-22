class Debttable < ApplicationRecord
  validates :balance, presence: true

  belongs_to :user, optional: true
  belongs_to :list
end
