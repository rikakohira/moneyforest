class RemoveAvailabilityFromDebttables < ActiveRecord::Migration[6.0]
  def change
    remove_column :debttables, :availability
  end
end
