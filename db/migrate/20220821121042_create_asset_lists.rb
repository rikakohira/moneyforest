class CreateAssetLists < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_lists do |t|
      t.references :assettable, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.timestamps
    end
  end
end
