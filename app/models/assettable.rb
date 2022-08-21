class Assettable < ApplicationRecord
  validates :balance ,presence: true

  belongs_to :user, optional: true
  has_many :asset_lists
  has_many :lists , through: :asset_lists
end
