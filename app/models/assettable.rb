class Assettable < ApplicationRecord
  belongs_to :user, optional: true
  validates :balance ,presence: true
end