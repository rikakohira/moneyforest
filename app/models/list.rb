class List < ApplicationRecord
  validates :group, :code, :code_name, presence: true

  has_many :assettables
  has_many :debttables
  has_many :debits, foreign_key: :d_lit_id
  has_many :credits,foreign_key: :c_lit_id
end
