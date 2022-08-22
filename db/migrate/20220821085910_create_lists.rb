class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :group, null: false
      t.integer :code, null: false
      t.string :code_name, null: false
      t.string :memo
      t.timestamps
    end
  end
end
