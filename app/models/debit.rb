class Debit < ApplicationRecord
  has_one :credit
  belongs_to :list, class_name: 'List', foreign_key: :d_list_id
  belongs_to :user
end
