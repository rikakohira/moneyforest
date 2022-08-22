class List < ApplicationRecord
  validates :group, :code, :code_name, presence: true
  
  has_many :assettables
  has_many :debttables
end
