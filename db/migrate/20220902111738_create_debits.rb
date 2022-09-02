class CreateDebits < ActiveRecord::Migration[6.0]
  def change
    create_table :debits do |t|
      t.date :date, null: false
      t.integer :debit_amount, null: false
      t.references :list, null: false, foreign_key: true
      t.timestamps
    end
  end
end
