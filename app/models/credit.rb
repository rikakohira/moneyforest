class Credit < ApplicationRecord
  belongs_to :debit
  belongs_to :list, class_name: 'List', foreign_key: :c_list_id
end
