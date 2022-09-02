class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.integer :credit_amount, null: false
      t.references :list, null: false, foreign_key: true
      t.references :debit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
