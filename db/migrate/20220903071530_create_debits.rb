class CreateDebits < ActiveRecord::Migration[6.0]
  def change
    create_table :debits do |t|
      t.date :date, null: false
      t.integer :debit_amount, null: false
      t.text :memo
      t.bigint :d_list_id, index: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    # 外部キーのカラム名を変更
    add_foreign_key :debits, :lists, column: :d_list_id
  end
end
