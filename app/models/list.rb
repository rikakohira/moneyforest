class List < ApplicationRecord
  validates :group, :code, :code_name, presence: true
  
  has_many :asset_lists
  has_many :assettables, through: :asset_lists
end
