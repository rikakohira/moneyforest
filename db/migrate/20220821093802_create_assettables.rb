class CreateAssettables < ActiveRecord::Migration[6.0]
  def change
    create_table :assettables do |t|
      t.integer :balance, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
