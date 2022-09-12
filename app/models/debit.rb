class Debit < ApplicationRecord
  has_one :credit, dependent: :destroy
  belongs_to :list, class_name: 'List', foreign_key: :d_list_id
  belongs_to :user
end
