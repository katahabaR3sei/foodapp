class AddAddressIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :address_id, :integer
  end
end
