class List < ApplicationRecord
  has_many :asset_lists
  has_many :assettables, through: :asset_lists
end
