class RemoveAvailabilityToAssettables < ActiveRecord::Migration[6.0]
  def change
    remove_column :assettables, :availability
  end
end