class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.integer :credit_amount, null: false
      t.bigint :c_list_id, index: true
      t.references :debit, null: false, foreign_key: true
      t.timestamps
    end
    # 外部キーのカラム名を変更
    add_foreign_key :credits, :lists, column: :c_list_id
  end
end
