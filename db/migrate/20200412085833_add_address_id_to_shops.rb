class AddAddressIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :addresse_id, :integer
  end
end
